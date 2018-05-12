# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Turtle do
  let(:subject) { RougeLines::Lexers::Turtle.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ttl'
      assert_guess :filename => 'foo.trig'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/turtle'
      assert_guess :mimetype => 'application/trig'
    end
  end
end
