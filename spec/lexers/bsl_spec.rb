# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Bsl do
  let(:subject) { RougeLines::Lexers::Bsl.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.bsl'
      assert_guess :filename => 'foo.os'
    end
  end
end
