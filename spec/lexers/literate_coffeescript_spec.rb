# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::LiterateCoffeescript do
  let(:subject) { RougeLines::Lexers::LiterateCoffeescript.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.litcoffee'
    end
  end
end
