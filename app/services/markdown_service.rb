class MarkdownService
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def initialize
    options = {
      autolink:           true,
      no_intra_emphasis:  true,
      fenced_code_blocks: true,
      lax_html_blocks:    true,
      strikethrough:      true,
      superscript:        true
    }
    @markdown = Redcarpet::Markdown.new(HTMLwithPygments, options)
  end

  def markdown(text)
    @markdown.render(text).html_safe
  end
end