# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::CommonLisp do
  let(:subject) { RougeLines::Lexers::CommonLisp.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.cl'
      assert_guess :filename => 'foo.lisp'
      assert_guess :filename => 'foo.el'
      assert_guess :filename => 'foo.asd'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-common-lisp'
    end
  end
end
