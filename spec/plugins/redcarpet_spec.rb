# -*- coding: utf-8 -*- #

require 'rouge/plugins/redcarpet'
describe RougeLines::Plugins::Redcarpet do
  # skip if redcarpet isn't loaded
  next unless Object.const_defined? :Redcarpet

  let(:redcarpet) {
    Class.new(Redcarpet::Render::HTML) do
      include RougeLines::Plugins::Redcarpet
    end
  }

  let(:markdown) {
    Redcarpet::Markdown.new(redcarpet.new, :fenced_code_blocks => true)
  }

  it 'renders a thing' do
    result = markdown.render <<-mkd
``` javascript
var foo = 1;
```

``` shell
foo=1
```
    mkd

    assert { result.include?(%(<pre class="highlight shell"><code>)) }
    assert { result.include?(%(<pre class="highlight javascript"><code>)) }
  end

  it 'guesses' do
    result = markdown.render <<-mkd
``` guess
#!/usr/bin/env ruby
puts "hello, world"
```
    mkd

    assert { result.include?(%(<pre class="highlight ruby"><code>)) }
  end

  it 'passes options' do
    result = markdown.render <<-mkd
``` shell?k=v
foo=1
```
    mkd

    # TODO: test that an option is actually there
    assert { result.include?(%(<pre class="highlight shell"><code>)) }
  end

  it 'works when no language is provided' do
    result = markdown.render <<-mkd
```
#!/usr/bin/env ruby
$stdin.each { |l| $stdout.puts l.reverse }
```
    mkd
    assert { result.include?(%(<pre class="highlight ruby"><code>)) }
  end
end
