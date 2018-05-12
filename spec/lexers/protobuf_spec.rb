# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Protobuf do
  let(:subject) { RougeLines::Lexers::Protobuf.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.proto'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-proto'
    end
  end
end
