# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  body           :text
#  featured_image :string
#  author_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :author
  mount_uploader :featured_image, FeaturedImageUploader
  after_create :post_to_twitter

  validates :title, :body, :author_id, presence: true
  validates :twitter_message, length: { maximum: 105 }, allow_blank: true
  validates_presence_of :featured_image, message: 'needs to be uploaded.'

  private

    def post_to_twitter
      tweet_content = TweetConstructorService.new(self).tweet
      self.author.twitter.update(tweet_content)
    end

end
