module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text)
    options = {
      autolink:           true,
      no_intra_emphasis:  true,
      fenced_code_blocks: true,
      lax_html_blocks:    true,
      strikethrough:      true,
      superscript:        true
    }
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, options).render(text).html_safe
  end
end
