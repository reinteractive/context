class AddSlugToSnippetsForPage < ActiveRecord::Migration
  def self.up
    # The Page model, which inherits from Snippets, needs to have a URL slug.
    add_column :snippets, :slug, :string, :default => nil, :null => true
  end

  def self.down
    remove_column :snippets, :slug
  end
end
