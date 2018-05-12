# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Sieve do
  let(:subject) { RougeLines::Lexers::Sieve.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.sieve'
    end
  end
end
