# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Java do
  let(:subject) { RougeLines::Lexers::Java.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.java'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-java'
    end
  end
end
