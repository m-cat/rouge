# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::AppleScript do
  let(:subject) { RougeLines::Lexers::AppleScript.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.applescript'
      assert_guess :filename => 'foo.scpt'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'application/x-applescript'
    end
  end
end
