require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new(:run)
end

desc "Sets up the environment and runs the specs"
task :spec => [ 'test:db:copy_migrations', 'test:db:migrate', 'spec:run' ]

task :default => :spec
