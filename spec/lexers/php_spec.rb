# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::PHP do
  let(:subject) { RougeLines::Lexers::PHP.new }

  describe 'guessing' do
    include Support::Guessing

    it 'Guesses files containing <?php' do
      assert_guess :source => '<?php foo();'
    end

    it 'Guesses PHP files that do not contain Hack code' do
      assert_guess :filename => 'foo.php', :source => '<? foo();'
    end

    it 'Guesses .php files containing <?, but not hack code' do
      deny_guess :filename => 'foo.php', :source => '<?hh // strict'
    end

    it "Does not guess files containing <?hh" do
      deny_guess :source => '<?hh foo();'
      deny_guess :source => '<?hh // strict'
      deny_guess :filename => '.php', :source => '<?hh foo();'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'recognizes hash comments not followed by a newline (#797)' do
      assert_tokens_equal '# comment', ['Comment.Single', '# comment']
    end

    it 'recognizes double-slash comments not followed by a newline (#797)' do
      assert_tokens_equal '// comment', ['Comment.Single', '// comment']
    end
  end
end
