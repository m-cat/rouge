# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::Powershell do
  let(:subject) { RougeLines::Lexers::Powershell.new }
  
  # Someone may need to add actual tests here. TODO

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.ps1'
      assert_guess :filename => 'foo.psm1'
      assert_guess :filename => 'foo.psd1'
      assert_guess :filename => 'foo.psrc'
      assert_guess :filename => 'foo.pssc'
    end

  end
end
