# -*- coding: utf-8 -*- #

describe RougeLines::Token do
  it 'has a name' do
    assert { RougeLines::Token['Text'].qualname == 'Text' }
    assert { RougeLines::Token['Literal.String'].qualname == 'Literal.String' }
  end

  it 'has shortnames' do
    assert { RougeLines::Token['Name'].shortname == 'n' }
    assert { RougeLines::Token['Literal.String.Backtick'].shortname == 'sb' }
  end

  it 'calculates ancestors' do
    chain = RougeLines::Token['Literal.String.Backtick'].token_chain.map(&:qualname)

    assert { chain == %w(Literal Literal.String Literal.String.Backtick) }
  end
end
