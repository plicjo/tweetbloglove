# Twitter allows a maximum of 140 characters
# All links in twitter count as 22 characters
# Content(105 char) + '...' + Link(22 char) = 140 char
class TweetConstructorService
  include Rails.application.routes.url_helpers
  MAX_CHARACTERS = 105

  attr_reader :link, :content

  def initialize post
    @link    = post_url(post)
    @content = post.twitter_message || post.title.strip
  end

  def generate_tweet
    "#{truncate_content}#{@link}"
  end

  private

    def truncate_content
      if @content.length > MAX_CHARACTERS
        "#{@content[0...(MAX_CHARACTERS - 1)]}..."
      else
        "#{@content}..."
      end
    end

end