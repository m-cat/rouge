# -*- coding: utf-8 -*- #

require 'rouge/cli'

describe RougeLines::CLI do
  let(:argv) { [] }
  subject { RougeLines::CLI.parse(argv) }

  describe RougeLines::CLI::Help do
    describe '-h' do
      let(:argv) { %w(-h) }
      it('parses') { assert { RougeLines::CLI::Help === subject } }
    end

    describe '--help' do
      let(:argv) { %w(--help) }
      it('parses') { assert { RougeLines::CLI::Help === subject } }
    end

    describe 'help' do
      let(:argv) { %w(help) }
      it('parses') { assert { RougeLines::CLI::Help === subject } }
    end

    describe 'nil' do
      let(:argv) { %w() }
      it('parses') { assert { RougeLines::CLI::Help === subject } }
    end
  end

  describe RougeLines::CLI::Highlight do
    describe 'specifying a lexer' do
      let(:argv) { %w(highlight -l ruby) }
      it('parses') {
        assert { RougeLines::CLI::Highlight === subject }
        assert { RougeLines::Lexers::Ruby === subject.lexer }
      }
    end

    describe 'guessing a lexer by mimetype' do
      let(:argv) { %w(highlight -m application/javascript) }
      it('parses') {
        assert { RougeLines::Lexers::Javascript === subject.lexer }
      }
    end

    describe 'guessing a lexer by file contents' do
      let(:argv) { %w(highlight -i bin/rougify) }
      it('parses') {
        assert { RougeLines::Lexers::Ruby === subject.lexer }
      }
    end
  end

  describe RougeLines::CLI::List do
    describe 'list' do
      let(:argv) { %w(list) }
      it('parses') { assert { RougeLines::CLI::List === subject } }

      it 'lists available lexers' do
        out, err = capture_io { subject.run }

        expected_tags = RougeLines::Lexer.all.map(&:tag).sort
        actual_tags = out.scan(/^([^\s]*?):/).flatten

        assert_equal expected_tags, actual_tags, "err: #{err.inspect}"
      end
    end
  end
end
