# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::TSX do
  let(:subject) { RougeLines::Lexers::TSX.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.tsx'
    end
  end
end
