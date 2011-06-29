require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec
