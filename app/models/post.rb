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
  before_create :post_to_twitter

  validates :title, :body, :author_id, presence: true
  validates_presence_of :featured_image, message: 'needs to be uploaded.'

  private

    # The tweet constructor requires the post object to be saved
    def post_to_twitter
      if self.id
        tweet_content = TweetConstructorService.new(self).generate_tweet
        self.author.twitter.update(tweet_content)
      end
    end

end
