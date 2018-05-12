# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Jinja do
  let(:subject) { RougeLines::Lexers::Jinja.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by mimetype' do
      assert_guess mimetype: 'application/x-django-templating'
      assert_guess mimetype: 'application/x-jinja'
      assert_guess mimetype: 'text/html+django'
      assert_guess mimetype: 'text/html+jinja'
    end
  end
end
