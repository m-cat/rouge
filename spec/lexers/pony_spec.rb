# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Pony do
  let(:subject) { RougeLines::Lexers::Pony.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.pony'
    end
  end
end
