# -*- coding: utf-8 -*- #

describe RougeLines::Formatters::Terminal256 do
  let(:subject) { RougeLines::Formatters::Terminal256.new }

  it 'renders a thing' do
    result = subject.format([[Token['Text'], 'foo']])

    assert { result == "\e[38;5;230mfoo\e[39m" }
  end
end
