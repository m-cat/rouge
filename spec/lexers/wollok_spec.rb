# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Wollok do
  let(:subject) { RougeLines::Lexers::Wollok.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.wlk'
      assert_guess :filename => 'foo.wtest'
      assert_guess :filename => 'foo.wpgm'
    end
  end
end
