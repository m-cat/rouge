describe RougeLines::Formatter do
  it 'finds terminal256' do
    assert { RougeLines::Formatter.find('terminal256') }
  end

  it 'is found by RougeLines.highlight' do
    assert { RougeLines.highlight('puts "Hello"', 'ruby', 'terminal256') }
  end
end
