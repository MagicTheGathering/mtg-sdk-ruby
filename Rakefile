require "bundler/gem_tasks"
require 'rake/testtask'
require_relative 'lib/mtg_sdk'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :cards do
  cards = MTG::Card.where(name: 'zurgo').get
  puts cards.first.name
end