# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Ceylon do
  let(:subject) { RougeLines::Lexers::Ceylon.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ceylon'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-ceylon'
    end
  end
end
