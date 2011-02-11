class RenameSnippetsPathToContextPath < ActiveRecord::Migration
  def self.up
    rename_column :snippets, :path, :context_path
  end

  def self.down
    rename_column :snippets, :context_path, :path
  end
end
