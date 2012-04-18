# This migration comes from gko_image (originally 20111020000000)
class CreateImageStickers < ActiveRecord::Migration
  def up
    unless table_exists?(:image_stickers)
      create_table :image_stickers do |t|
        t.string :name
        t.references :site
        t.timestamps
      end
      add_index :image_stickers, :name
    
      create_table :image_stickings do |t|
        t.references :sticker
        t.references :image
        t.integer :image_stickings_count, :default => 0
        t.timestamps
      end
    
      add_index :image_stickings, [:sticker_id, :image_id]

      create_table :image_folders do |t| 
        t.string :name 
        t.references :site
        t.references :parent 
        t.integer :lft
        t.integer :rgt
        t.integer :level
        t.timestamps
      end
      add_column :images, :image_folder_id, :integer
      add_index :images, [:image_folder_id] 
    end
  end

  def down
    drop_table :image_stickings
    drop_table :image_stickers
    drop_table :image_folders 
    remove_column :images, :image_folder_id, :integer
    remove_index :images, [:image_folder_id]
  end
end