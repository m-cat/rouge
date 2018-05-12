# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Docker do
  let(:subject) { RougeLines::Lexers::Docker.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'Dockerfile'
      assert_guess :filename => 'docker.docker'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-dockerfile-config'
    end
  end
end
