class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :name
      t.text :body
      t.string :format
      t.text :cached_html
      t.boolean :published
      t.integer :parent_id
      t.string :type
      t.string :slug, :default => nil, :null => true
      t.string :context_path, :default => nil, :null => true
      t.string :ancestry

      t.timestamps
    end

    add_index :snippets, :context_path
    add_index :snippets, :ancestry
  end

  def self.down
    drop_table :snippets
  end
end
