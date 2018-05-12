# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Smarty do
  let(:subject) { RougeLines::Lexers::Smarty.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.tpl'
      assert_guess :filename => 'foo.smarty'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'application/x-smarty'
      assert_guess :mimetype => 'text/x-smarty'
    end
  end
end
