# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  title             :string
#  body              :text
#  featured_image    :string
#  author_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  twitter_message   :string
#  published         :boolean          default(FALSE)
#  publish_in_future :boolean          default(FALSE)
#

class Post < ActiveRecord::Base
  belongs_to :author
  mount_uploader :featured_image, FeaturedImageUploader
  after_create :post_to_twitter
  attr_accessor :publish_date

  validates :title, :body, :author_id, presence: true
  validates :twitter_message, length: { maximum: 105 }, allow_blank: true
  validates_presence_of :featured_image, message: 'needs to be uploaded.'

  def self.published_or_authored author
    (published_posts + authored_posts(author)).uniq
  end

  def publish_later publish_time
    PublishPostsJob.set(wait_until: publish_time).perform_later(self.id)
  end 

  private

    def post_to_twitter
      tweet_content = TweetConstructorService.new(self).tweet
      self.author.twitter.update(tweet_content)
    end

    def self.published_posts
      Post.where(published: true)
    end

    def self.authored_posts author
      author ? Post.where(author_id: author.id) : []
    end

end
