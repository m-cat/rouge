# -*- coding: utf-8 -*- #

describe RougeLines::Formatters::HTML do
  let(:subject) { RougeLines::Formatters::HTMLLegacy.new(options) }
  let(:options) { {} }

  describe 'skipping the wrapper' do
    let(:subject) { RougeLines::Formatters::HTML.new }
    let(:output) { subject.format([[Token['Name'], 'foo']]) }
    let(:options) { { :wrap => false } }

    it 'skips the wrapper' do
      assert { output == '<span class="n">foo</span>' }
    end
  end

  describe '#inline_theme' do
    class InlineTheme < RougeLines::CSSTheme
      style Name, :bold => true
    end

    let(:options) { { :inline_theme => InlineTheme.new, :wrap => false } }

    let(:output) {
      subject.format([[Token['Name'], 'foo']])
    }

    it 'inlines styles given a theme' do
      assert { output == '<span style="font-weight: bold">foo</span>' }
    end
  end

  describe 'tableized line numbers' do
    let(:options) { { :line_numbers => true } }

    let(:tokens) { RougeLines::Lexers::Clojure.lex(text) }

    let(:output) { subject.format(tokens) }
    let(:line_numbers) { output[%r[<pre class="lineno".*?</pre>]m].scan(/\d+/m).size }

    let(:output_code) {
      output =~ %r(<td.*?>(.*?)</td>)m
      $1
    }

    let(:code_lines) { output_code.scan(/\n/).size }

    describe 'newline-terminated text' do
      let(:text) { RougeLines::Lexers::Clojure.demo }

      it 'preserves the number of lines' do
        assert { code_lines == line_numbers }
      end
    end

    describe 'non-newline-terminated text' do
      let(:text) { RougeLines::Lexers::Clojure.demo.chomp }

      it 'preserves the number of lines' do
        assert { code_lines == line_numbers }
      end
    end
  end
end
