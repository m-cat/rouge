# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::PlainText do
  let(:subject) { RougeLines::Lexers::PlainText.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo'
      assert_guess :filename => 'foo.txt'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/plain'
      assert_guess :mimetype => 'text/x-something-else'
    end

    it 'guesses by source' do
      assert_guess :source => 'zorbl'
      assert_guess :source => '-:-:-:-:-'
    end
  end
end
