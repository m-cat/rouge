# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Coq do
  let(:subject) { RougeLines::Lexers::Coq.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-coq'
    end
  end
end
