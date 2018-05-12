# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::INI do
  let(:subject) { RougeLines::Lexers::INI.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ini'
      assert_guess :filename => '.gitconfig'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-ini'
    end
  end
end
