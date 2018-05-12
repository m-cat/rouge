# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::HyLang do
  let(:subject) { RougeLines::Lexers::HyLang.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.hy'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-hy'
      assert_guess :mimetype => 'application/x-hy'
    end
  end
end
