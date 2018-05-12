# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Hack do
  let(:subject) { RougeLines::Lexers::Hack.new }

  describe 'guessing' do
    include Support::Guessing


    it 'Guesses .php and .hh files that contain Hack code' do
      assert_guess :filename => 'foo.php', :source => '<?hh // strict'
      assert_guess :filename => 'foo.hh', :source => '<?hh // strict'
    end

    it 'Does not guess .php or .hh files that contain non-hack code' do
      deny_guess :filename => 'foo.php', :source => '<? foo();'
      ######deny_guess :filename => 'foo.hh', :source => '#include <foo.h>'
    end
  end
end
