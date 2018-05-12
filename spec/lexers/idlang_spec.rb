# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::IDLang do
  let(:subject) { RougeLines::Lexers::IDLang.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      #assert_guess :filename => 'foo.pro'
      assert_guess :filename => 'foo.idl'
    end
  end
end
