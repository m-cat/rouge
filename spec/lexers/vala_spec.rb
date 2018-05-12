# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Vala do
  let(:subject) { RougeLines::Lexers::Vala.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.vala'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-vala'
    end
  end
end
