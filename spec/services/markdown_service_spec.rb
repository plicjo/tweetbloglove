require 'rails_helper'

describe MarkdownService do
  describe '#markdown' do
    let(:content) { "# Article Title" }

    it 'should process markdown to HTML' do
      rendered_content = MarkdownService.new.markdown(content)
      expect(rendered_content).to include('<h1>')
    end
  end
end