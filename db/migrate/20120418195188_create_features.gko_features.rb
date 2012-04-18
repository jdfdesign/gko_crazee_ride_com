# This migration comes from gko_features (originally 20111228000000)
class CreateFeatures < ActiveRecord::Migration
  def up
    unless table_exists?(:features)
      create_table :features do |t|
        t.references :site
        t.references :section
        t.references :owner, :polymorphic => true
        t.string :url
        t.string :title
        t.text :body
        t.datetime :published_at
        t.integer :position, :default => 1
      
        t.string :image_mime_type
        t.string :image_name
        t.integer :image_size
        t.integer :image_width
        t.integer :image_height
        t.string :image_uid
        t.string :image_ext
      
        t.timestamps
      end
    
      add_index :features, [:owner_type, :owner_id]
      add_index :features, [:position, :section_id]
    end   
  end

  def down
    drop_table :features
  end
end