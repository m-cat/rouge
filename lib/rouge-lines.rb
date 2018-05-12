# -*- coding: utf-8 -*- #

# stdlib
require 'pathname'

# The containing module for RougeLines
module RougeLines
  class << self
    def reload!
      Object.send :remove_const, :RougeLines
      load __FILE__
    end

    # Highlight some text with a given lexer and formatter.
    #
    # @example
    #   RougeLines.highlight('@foo = 1', 'ruby', 'html')
    #   RougeLines.highlight('var foo = 1;', 'js', 'terminal256')
    #
    #   # streaming - chunks become available as they are lexed
    #   RougeLines.highlight(large_string, 'ruby', 'html') do |chunk|
    #     $stdout.print chunk
    #   end
    def highlight(text, lexer, formatter, &b)
      lexer = Lexer.find(lexer) unless lexer.respond_to? :lex
      raise "unknown lexer #{lexer}" unless lexer

      formatter = Formatter.find(formatter) unless formatter.respond_to? :format
      raise "unknown formatter #{formatter}" unless formatter

      formatter.format(lexer.lex(text), &b)
    end
  end
end

load_dir = Pathname.new(__FILE__).dirname
load load_dir.join('rouge-lines/version.rb')

load load_dir.join('rouge-lines/util.rb')

load load_dir.join('rouge-lines/text_analyzer.rb')
load load_dir.join('rouge-lines/token.rb')

load load_dir.join('rouge-lines/lexer.rb')
load load_dir.join('rouge-lines/regex_lexer.rb')
load load_dir.join('rouge-lines/template_lexer.rb')

lexers_dir = load_dir.join('rouge-lines/lexers')
Dir.glob(lexers_dir.join('*.rb')).each do |f|
  RougeLines::Lexers.load_lexer(Pathname.new(f).relative_path_from(lexers_dir).to_s)
end

load load_dir.join('rouge-lines/guesser.rb')
load load_dir.join('rouge-lines/guessers/util.rb')
load load_dir.join('rouge-lines/guessers/glob_mapping.rb')
load load_dir.join('rouge-lines/guessers/modeline.rb')
load load_dir.join('rouge-lines/guessers/filename.rb')
load load_dir.join('rouge-lines/guessers/mimetype.rb')
load load_dir.join('rouge-lines/guessers/source.rb')
load load_dir.join('rouge-lines/guessers/disambiguation.rb')

load load_dir.join('rouge-lines/formatter.rb')
load load_dir.join('rouge-lines/formatters/html.rb')
load load_dir.join('rouge-lines/formatters/html_table.rb')
load load_dir.join('rouge-lines/formatters/html_pygments.rb')
load load_dir.join('rouge-lines/formatters/html_legacy.rb')
load load_dir.join('rouge-lines/formatters/html_lineanchors.rb')
load load_dir.join('rouge-lines/formatters/html_linewise.rb')
load load_dir.join('rouge-lines/formatters/html_inline.rb')
load load_dir.join('rouge-lines/formatters/terminal256.rb')
load load_dir.join('rouge-lines/formatters/null.rb')

load load_dir.join('rouge-lines/theme.rb')
load load_dir.join('rouge-lines/themes/thankful_eyes.rb')
load load_dir.join('rouge-lines/themes/colorful.rb')
load load_dir.join('rouge-lines/themes/base16.rb')
load load_dir.join('rouge-lines/themes/github.rb')
load load_dir.join('rouge-lines/themes/igor_pro.rb')
load load_dir.join('rouge-lines/themes/monokai.rb')
load load_dir.join('rouge-lines/themes/molokai.rb')
load load_dir.join('rouge-lines/themes/monokai_sublime.rb')
load load_dir.join('rouge-lines/themes/gruvbox.rb')
load load_dir.join('rouge-lines/themes/tulip.rb')
load load_dir.join('rouge-lines/themes/pastie.rb')
