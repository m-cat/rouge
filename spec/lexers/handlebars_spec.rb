# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Handlebars do
  let(:subject) { RougeLines::Lexers::Handlebars.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.handlebars'
      assert_guess :filename => 'foo.hbs'
      assert_guess :filename => 'foo.mustache'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-handlebars'
    end
  end
end
