# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Erlang do
  let(:subject) { RougeLines::Lexers::Erlang.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.erl'
      assert_guess :filename => 'foo.hrl'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-erlang'
      assert_guess :mimetype => 'application/x-erlang'
    end
  end
end
