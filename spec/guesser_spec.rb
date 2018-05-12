describe RougeLines::Guesser do
  include Support::Guessing

  describe 'guessing with custom globs' do
    it 'guesses correctly' do
      assert_guess(RougeLines::Lexers::Javascript,
        :custom_globs => [['*.pl', 'javascript']],
        :filename => 'oddly-named.pl'
      )
    end
  end

  describe 'guessing with custom guessing strategies' do
    it 'guesses in order' do
      assert_guess(RougeLines::Lexers::Ruby,
        :guessers => [
          RougeLines::Guessers::Source.new('#!/usr/bin/env ruby'),
          RougeLines::Guessers::Filename.new('foo.md'),
        ]
      )

      assert_guess(RougeLines::Lexers::Markdown,
        :guessers => [
          RougeLines::Guessers::Filename.new('foo.md'),
          RougeLines::Guessers::Source.new('#!/usr/bin/env ruby'),
        ]
      )
    end

    it 'uses custom guessers' do
      passed_lexers = nil

      custom = Class.new(RougeLines::Guesser) {
        define_method(:filter) { |lexers|
          passed_lexers = lexers

          [RougeLines::Lexers::Javascript]
        }
      }.new

      assert_guess(RougeLines::Lexers::Javascript, :guessers => [custom])
      assert { passed_lexers.size == RougeLines::Lexer.all.size }
    end

    it 'sequentially filters' do
      custom = Class.new(RougeLines::Guesser) {
        define_method(:filter) { |lexers|
          passed_lexers = lexers

          [RougeLines::Lexers::Javascript, RougeLines::Lexers::Prolog]
        }
      }.new

      assert_guess(RougeLines::Lexers::Prolog,
        :guessers => [
          custom,
          RougeLines::Guessers::Filename.new('foo.pl'),
        ]
      )
    end

    it 'filters with a lambda' do
      assert_guess(RougeLines::Lexers::C,
        :guessers => [
          ->(lexers) { [ RougeLines::Lexers::C ] }
        ]
      )
    end
  end

  describe 'modeline guessing' do
    it 'guesses by modeline' do
      # don't confuse actual editors when opening this file lol
      assert_guess(RougeLines::Lexers::Ruby, :source => '# v' + 'im: syntax=ruby')
    end
  end
end
