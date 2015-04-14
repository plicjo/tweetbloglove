# Twitter allows a maximum of 140 characters
# All links in twitter count as 22 characters
# Content(105 char) + '...' + Link(22 char) = 140 char
class TweetConstructorService
  include Rails.application.routes.url_helpers

  attr_reader :link, :content

  def initialize post
    @link    = "#{post_url(post)}"
    @content = "#{post.title}"
  end

  def generate_tweet
    "#{truncate(@content)}#{@link}"
  end

  private

    def truncate(text, max = 104)
      if text.length > max 
        "#{text[0...max]}..."
      else
        "#{text}..."
      end
    end

end