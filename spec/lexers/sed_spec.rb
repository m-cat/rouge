# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Sed do
  let(:subject) { RougeLines::Lexers::Sed.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.sed'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-sed'
    end

    it 'guesses by source' do
      assert_guess :source => '#!/usr/bin/sed'
    end
  end
end
