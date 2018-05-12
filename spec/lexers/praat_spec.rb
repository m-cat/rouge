# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Praat do
  let(:subject) { RougeLines::Lexers::Praat.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.praat'
      assert_guess :filename => 'foo.proc'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'unquoted string directives' do
      assert_tokens_equal "echo unquoted 1",
        ['Keyword',        'echo'],
        ['Text',           ' '],
        ['Literal.String', 'unquoted 1']
    end

    it 'string function' do
      assert_tokens_equal "string$()",
        ['Name.Function',  'string$'],
        ['Text',           '()']
    end

    it 'string variable' do
      assert_tokens_equal "string$",
        ['Text',           'string$']
    end

    it 'shorthand procedure call' do
      assert_tokens_equal 'call procedure "arg" 1 unquoted',
        ['Keyword',        'call'],
        ['Text',           ' '],
        ['Name.Function',  'procedure'],
        ['Text',           ' '],
        ['Literal.String', '"arg"'],
        ['Text',           ' '],
        ['Literal.Number', '1'],
        ['Text',           ' unquoted']
    end

    it 'new-style procedure call' do
      assert_tokens_equal '@procedure: "arg", 1',
        ['Name.Function',  '@procedure'],
        ['Punctuation',    ':'],
        ['Text',           ' '],
        ['Literal.String', '"arg"'],
        ['Punctuation',    ','],
        ['Text',           ' '],
        ['Literal.Number', '1']
    end

  end
end
