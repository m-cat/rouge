# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Groovy do
  let(:subject) { RougeLines::Lexers::Groovy.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.groovy'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-groovy'
    end
  end
end
