describe RougeLines::Formatters::HTMLPygments do
  let(:formatter) { RougeLines::Formatters::HTML.new }
  let(:source) { 'echo "Hello World"' }
  let(:lexer) { RougeLines::Lexers::Shell.new }
  let(:subject) { RougeLines::Formatters::HTMLPygments.new(formatter, lexer.tag) }
  let(:output) { subject.format(lexer.lex(source)) }

  it 'wrap with div.highlight' do
    assert { output =~ /\A<div class="highlight">.+<\/div>\Z/ }
  end

  it 'contain pre with class name "shell"' do
    assert { output =~ /<pre class="shell">/ }
  end
end
