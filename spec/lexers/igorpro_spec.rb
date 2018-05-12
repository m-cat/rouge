# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::IgorPro do
  let(:subject) { RougeLines::Lexers::IgorPro.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ipf'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-igorpro'
    end
  end
end
