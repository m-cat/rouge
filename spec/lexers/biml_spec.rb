# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::BIML do
  let(:subject) { RougeLines::Lexers::BIML.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.biml'
    end

    it 'guesses by source' do
      assert_guess :source => '<Biml></Biml>'
    end
  end
end
