class AddAncestryToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :ancestry, :string
    add_index :snippets, :ancestry
  end

  def self.down
    remove_column :snippets, :ancestry
  end
end
