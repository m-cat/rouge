# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Awk do
  let(:subject) { RougeLines::Lexers::Awk.new }

  describe 'lexing' do
    include Support::Lexing

    it %(doesn't let a bad regex mess up the whole lex) do
      assert_has_token 'Error',          "a = /foo;\n1"
      assert_has_token 'Literal.Number', "a = /foo;\n1"
    end
  end

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.awk'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'application/x-awk'
    end

    it 'guesses by source' do
      assert_guess :source => '#!/usr/bin/awk'
      assert_guess :source => '#!/usr/bin/env awk'
    end
  end
end
