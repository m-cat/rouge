# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Matlab do
  let(:subject) { RougeLines::Lexers::Matlab.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.m', :source => '% comment'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-matlab'
      assert_guess :mimetype => 'application/x-matlab'
    end
  end
end

