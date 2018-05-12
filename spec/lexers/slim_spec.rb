# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Slim do
  let(:subject) { RougeLines::Lexers::Slim.new }
  include Support::Lexing

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.slim'
    end
  end

  describe 'regression: lexing heredocs' do
    it 'doesn\'t throw an error' do
      subject.lex('-<<x').to_a
    end
  end

end
