# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Typescript do
  let(:subject) { RougeLines::Lexers::Typescript.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ts'
      assert_guess :filename => 'foo.d.ts'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/typescript'
    end
  end
end
