# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Moonscript do
  let(:subject) { RougeLines::Lexers::Moonscript.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.moon'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-moonscript'
      assert_guess :mimetype => 'application/x-moonscript'
    end

    it 'guesses by source' do
      assert_guess :source => '#!/usr/local/bin/moon'
      assert_guess :source => '#! /usr/bin/env moon'
    end
  end
end
