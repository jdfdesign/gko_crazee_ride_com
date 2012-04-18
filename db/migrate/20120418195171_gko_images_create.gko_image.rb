# This migration comes from gko_image (originally 20110311111111)
class GkoImagesCreate < ActiveRecord::Migration
  def up
    unless table_exists?(:images)
      create_table :images do |t|
        t.string :title, :limit => 100
        t.string :alt
        t.references :account
        t.references :author
        t.references :site
        t.integer :image_assignments_count, :default => 0
        t.timestamps

        t.string :image_mime_type
        t.string :image_name
        t.integer :image_size
        t.integer :image_width
        t.integer :image_height
        t.string :image_uid
        t.string :image_ext
      end 

      create_table :image_assignments do |t|
        t.integer :position, :null => false, :default => 1
        t.references :image, :null => false
        t.integer :attachable_id, :null => false
        t.string :attachable_type, :null => false, :limit => 40
        t.timestamps
      end

      add_index :image_assignments, [:attachable_id, :attachable_type]  
    end
  end

  def down
    drop_table :images
    drop_table :image_assignments
  end
end
