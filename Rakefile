require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubocop/rake_task'
Rake::RDocTask.new do |rd|
  rd.main = 'README.rdoc'
  rd.rdoc_files.include('README.rdoc', 'lib/**/*.rb', 'bin/**/*')
  rd.title = 'Sobriquet'
end

spec = eval(File.read('sobriquet.gemspec'))

Gem::PackageTask.new(spec)
desc 'Run features'
Cucumber::Rake::Task.new(:features) do |t|
  opts = 'features --format progress -x'
  opts += " --tags #{ENV['TAGS']}" if ENV['TAGS']
  t.cucumber_opts = opts
  t.fork = false
end

desc 'Run features tagged as work-in-progress (@wip)'
Cucumber::Rake::Task.new('features:wip') do |t|
  tag_opts = ' --tags @wip'
  t.cucumber_opts = "features --format pretty -x -s#{tag_opts}"
  t.fork = false
end

task cucumber: :features
task 'cucumber:wip' => 'features:wip'
task wip: 'features:wip'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

task default: [:test, :features]
