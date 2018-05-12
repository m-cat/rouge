# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Jsonnet do
  let(:subject) { RougeLines::Lexers::Jsonnet.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.jsonnet'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-jsonnet'
    end
  end
end
