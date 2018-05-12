# -*- coding: utf-8 -*- #

def php_references(&b)
  return enum_for :php_references unless block_given?

  php_manual_url = 'http://us3.php.net/distributions/manual/php_manual_en.tar.gz'

  sh 'mkdir -p /tmp/rouge'
  Dir.chdir '/tmp/rouge' do
    sh "wget -O- #{php_manual_url} | tar -xz"
    Dir.chdir './php-chunked-xhtml' do
      Dir.glob('./ref.*').sort.each { |x| yield File.read(x) }
    end
  end
end

def php_functions(&b)
  return enum_for :php_functions unless block_given?

  php_references do |file|
    file =~ %r(<title>(.*?) Functions</title>)
    name = $1

    next unless name

    functions = file.scan %r(<a href="function\..*?\.html">(.*?)</a>)

    yield [name, functions]
  end
end

def php_builtins_source
  yield   "# -*- coding: utf-8 -*- #"
  yield   "# automatically generated by `rake builtins:php`"
  yield   "module RougeLines"
  yield   "  module Lexers"
  yield   "    class PHP"
  yield   "      def self.builtins"
  yield   "        @builtins ||= {}.tap do |b|"
  php_functions do |n, fs|
    yield "          b[#{n.inspect}] = Set.new %w(#{fs.join(' ')})"
  end
  yield   "        end"
  yield   "      end"
  yield   "    end"
  yield   "  end"
  yield   "end"
end

namespace :builtins do
  task :php do
    File.open('lib/rouge-lines/lexers/php/builtins.rb', 'w') do |f|
      php_builtins_source do |line|
        f.puts line
      end
    end
  end
end
