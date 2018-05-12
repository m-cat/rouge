# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Nim do
  let(:subject) { RougeLines::Lexers::Nim.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.nim'
    end
  end
end
