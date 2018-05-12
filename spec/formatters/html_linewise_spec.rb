# -*- coding: utf-8 -*- #

describe RougeLines::Formatters::HTMLLinewise do
  let(:subject) { RougeLines::Formatters::HTMLLinewise.new(formatter, options) }
  let(:formatter) { RougeLines::Formatters::HTML.new }

  let(:options) { {} }
  let(:output) { subject.format(input_stream) }

  describe 'a simple token stream' do
    let(:input_stream) { [[Token['Name'], 'foo']] }

    it 'formats' do
      assert { output == %(<div class="line-1"><span class="n">foo</span></div>) }
    end
  end

  describe 'final newlines' do
    let(:input_stream) { [[Token['Text'], "foo\n"], [Token['Name'], "bar\n"]] }

    it 'formats' do
      assert { output == %(<div class="line-1">foo</div><div class="line-2"><span class="n">bar</span></div>) }
    end
  end

  describe 'intermediate newlines' do
    let(:input_stream) { [[Token['Name'], "foo\nbar"]] }

    it 'formats' do
      assert { output == %(<div class="line-1"><span class="n">foo</span></div><div class="line-2"><span class="n">bar</span></div>) }
    end
  end
end
