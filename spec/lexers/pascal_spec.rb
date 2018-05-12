# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Pascal do
  let(:subject) { RougeLines::Lexers::Pascal.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.pas'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-pascal'
    end
  end
end
