# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Dot do
  let(:subject) { RougeLines::Lexers::Dot.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.dot'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/vnd.graphviz'
    end
  end
end
