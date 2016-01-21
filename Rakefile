require "bundler/gem_tasks"
require 'rake/testtask'
require_relative 'lib/mtg_sdk'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "TODO"
  task :cards do
    card = MTG::Card.find(88803)
    puts card.rulings.first.date

  end
