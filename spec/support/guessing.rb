# -*- coding: utf-8 -*- #

module Support
  module Guessing
    def assert_guess(type=nil, info={})
      if type.is_a? Hash
        info = type
        type = nil
      end

      type ||= subject.class

      assert { RougeLines::Lexer.guess(info) == type }
      RougeLines::Lexer.all.reverse!

      assert { RougeLines::Lexer.guess(info) == type }
      RougeLines::Lexer.all.reverse!
    end

    def deny_guess(type=nil, info={})
      if type.is_a? Hash
        info = type
        type = nil
      end

      type ||= subject.class

      refute { RougeLines::Lexer.guess(info) == type }
      RougeLines::Lexer.all.reverse!

      refute { RougeLines::Lexer.guess(info) == type }
      RougeLines::Lexer.all.reverse!
    end
  end
end
