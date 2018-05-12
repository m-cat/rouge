# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::TOML do
  let(:subject) { RougeLines::Lexers::TOML.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.toml'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-toml'
    end
  end
end
