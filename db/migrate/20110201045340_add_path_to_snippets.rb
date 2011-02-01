class AddPathToSnippets < ActiveRecord::Migration
  def self.up
    # Pages have a cached path field, so as that we can easily find a Page from the request path
    add_column :snippets, :path, :string, :default => nil, :null => true
    add_index :snippets, :path
  end

  def self.down
    remove_column :snippets, :path
  end
end
