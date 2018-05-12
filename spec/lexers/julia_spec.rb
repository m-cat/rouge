# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Julia do
  let(:subject) { RougeLines::Lexers::Julia.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.jl'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-julia'
      assert_guess :mimetype => 'application/x-julia'
    end
  end
end
