# Twitter allows a maximum of 140 characters
# All links in twitter count as 22 characters
# Content(115 char) + '...'(3 char) + Link(22 char) = 140 char
class TweetConstructorService
  include Rails.application.routes.url_helpers
  MAX_CHARACTERS = 115

  attr_reader :post

  def initialize post
    @post = post
  end

  def tweet
    truncated_content + link
  end

  private

    def truncated_content
      content[0..(MAX_CHARACTERS - 1)] + '...'
    end

    def link
      post_url(post)
    end

    def content
      post.twitter_message.presence || post.title
    end

end