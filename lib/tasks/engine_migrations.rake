namespace :test do
  namespace :db do
    desc "Copies the engine migrations into spec/dummy/db/migrate"
    task :copy_migrations do
      FileUtils.cp_r("#{CONTEXT_ROOT}/db/migrate", "#{CONTEXT_ROOT}/spec/dummy/db")
    end

    desc "Migrates spec/dummy application"
    task :migrate do
      system "cd #{CONTEXT_ROOT}/spec/dummy; rake db:migrate db:test:prepare"
    end
  end
end
