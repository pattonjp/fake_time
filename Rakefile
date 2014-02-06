#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec

task :console do
  require 'pry'
  require 'y_not' # You know what to do.
  ARGV.clear
  Pry.start
end