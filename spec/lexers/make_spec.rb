# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Make do
  let(:subject) { RougeLines::Lexers::Make.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.make'
      assert_guess :filename => 'Makefile'
      assert_guess :filename => 'makefile'
      assert_guess :filename => 'Makefile.in'
      assert_guess :filename => 'GNUmakefile'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-makefile'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'recognizes declarations not terminated by a new line (#694)' do
      assert_tokens_equal "hello: \n\techo hello",
       ["Name.Label", "hello"], ["Operator", ":"], ["Text", " \n\t"], ["Name.Builtin", "echo "], ["Text", "hello"]
    end
  end
end
