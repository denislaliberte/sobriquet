require File.join([File.dirname(__FILE__), 'lib', 'sobriquet', 'version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'sobriquet'
  s.description = 'sobiquet is a command line tool that help you to save quickly new shell alias variables'
  s.version = Sobriquet::VERSION
  s.author = 'Denis Laliberté'
  s.email = 'denis@laliberte.io'
  s.license = 'mit'
  s.homepage = 'http://laliberte.io'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Sobriquet manage your alias'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'sobriquet.rdoc']
  s.rdoc_options << '--title' << 'sobriquet' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'sobriquet'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rubocop')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rubocop-rspec')
  s.add_runtime_dependency('gli', '2.14.0')
  s.add_runtime_dependency("mustache", "~> 1.0")
end
