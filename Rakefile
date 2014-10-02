require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/optionnil/**/*_test.rb'
  t.libs.push 'test'
end

task :default => :test

task :setup do
  require 'bundler/setup'
  Bundler.require(:default, :development)
end

task :console => [:setup] do
  require 'optionnil'
  Pry.start
end
