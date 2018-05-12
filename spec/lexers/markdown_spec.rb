# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Markdown do
  let(:subject) { RougeLines::Lexers::Markdown.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.md'
      assert_guess :filename => 'foo.mkd'
      assert_guess :filename => 'foo.markdown'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-markdown'
    end
  end
end
