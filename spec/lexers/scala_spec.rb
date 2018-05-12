# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Scala do
  let(:subject) { RougeLines::Lexers::Scala.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.scala'
      assert_guess :filename => 'foo.sbt'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-scala'
      assert_guess :mimetype => 'application/x-scala'
    end
  end
end
