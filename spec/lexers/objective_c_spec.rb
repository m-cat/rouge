# -*- coding: utf-8 -*- #

describe RougeLines::Lexers::ObjectiveC do
  let(:subject) { RougeLines::Lexers::ObjectiveC.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.m', :source => '@property'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-objective_c'
      assert_guess :mimetype => 'application/x-objective_c'
    end

    it 'guesses by source' do
      assert_guess :filename => 'foo.h', :source => '@"foo"'
      assert_guess :filename => 'foo.h', :source => '@implementation Foo'
    end
  end
end

