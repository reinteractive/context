class AddStiTypeToSnippets < ActiveRecord::Migration
  def self.up
    # Add a "type" field so as that Snippet can be extended using STI
    add_column :snippets, :type, :string
  end

  def self.down
    remove_column :snippets, :type
  end
end
