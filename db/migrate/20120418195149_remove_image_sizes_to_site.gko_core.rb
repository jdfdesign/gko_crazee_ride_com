# This migration comes from gko_core (originally 20110822000000)
class RemoveImageSizesToSite < ActiveRecord::Migration
  def up
    remove_column :sites, :image_sizes if column_exists?(:sites, :image_sizes)
  end

  def down
    add_column :sites, :image_sizes, :string, :default => '110x110>,225x255>,450x450>'
  end
end
