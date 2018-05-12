# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Twig do
  let(:subject) { RougeLines::Lexers::Twig.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by mimetype' do
      assert_guess mimetype: 'application/x-twig'
      assert_guess mimetype: 'text/html+twig'
    end
  end
end
