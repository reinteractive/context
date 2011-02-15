# TODO: Remove this once Rails 3.0.5 (or whatever) includes the engine tasks by default
namespace :context do
  desc "Copies the context migrations into db/migrate"
  task :install do
    FileUtils.cp_r(File.join(Context::Engine.root, 'db', 'migrate'), File.join(Rails.root, 'db'))
  end
end
