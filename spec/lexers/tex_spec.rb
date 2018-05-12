# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::TeX do
  let(:subject) { RougeLines::Lexers::TeX.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.tex'
      assert_guess :filename => 'foo.toc'
      assert_guess :filename => 'foo.aux'
      assert_guess :filename => 'foo.sty'
      assert_guess :filename => 'foo.cls'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-tex'
      assert_guess :mimetype => 'text/x-latex'
    end

    it 'guesses by source' do
      assert_guess :source => '\\documentclass'
      assert_guess :source => '\\ProvidesPackage'
      assert_guess :source => '\\ProvidesClass'
    end
  end
end
