namespace :test do
  namespace :db do
    desc "Copies the engine migrations into spec/dummy/db/migrate"
    task :copy_migrations do
      FileUtils.cp_r("#{CONTEXT_ROOT}/db/migrate", "#{ENGINE_ROOT}/spec/dummy/db")
    end
  end
end
