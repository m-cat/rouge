require './lib/rouge-lines/version'

Gem::Specification.new do |s|
  s.name = "rouge-lines"
  s.version = RougeLines.version
  s.authors = ["Jeanine Adkisson", "Marcin Swieczkowski"]
  s.email = ["jneen@jneen.net", "scatman@bu.edu"]
  s.summary = "A pure-ruby colorizer based on pygments. This fork supports line separation with divs."
  s.description = <<-desc.strip.gsub(/\s+/, ' ')
    RougeLines aims to a be a simple, easy-to-extend drop-in replacement
    for pygments. This fork supports line separation with divs.
  desc
  s.homepage = "https://github.com/m-cat/rouge"
  s.rubyforge_project = "rouge-lines"
  s.files = Dir['Gemfile', 'LICENSE', 'rouge-lines.gemspec', 'lib/**/*.rb', 'lib/**/*.yml', 'bin/rougify', 'lib/rouge-lines/demos/*']
  s.executables = %w(rougify)
  s.licenses = ['MIT', 'BSD-2-Clause']
  s.required_ruby_version = '>= 2.0'
  s.metadata = {
    'source_code_uri' => 'https://github.com/m-cat/rouge',
    'changelog_uri' => 'https://github.com/m-cat/rouge/blob/master/CHANGELOG.md'
  }
end
