class RemovePublishedFromSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :state, :string
    add_index :snippets, :state
    Context::Snippet.reset_column_information
    Context::Snippet.all.each do |snippet|
      snippet.state = snippet.published? ? "published" : "draft"
    end
    
    remove_column :snippets, :published
    
  end

  def self.down
  end
end
