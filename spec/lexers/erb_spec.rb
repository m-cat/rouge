# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::ERB do
  let(:subject) { RougeLines::Lexers::ERB.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.html.erb'
      assert_guess :filename => 'foo.eruby'
      assert_guess :filename => 'foo.rhtml'
    end
  end
end
