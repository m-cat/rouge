# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Cfscript do
  let(:subject) { RougeLines::Lexers::Cfscript.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.cfc'
    end

  end
end
