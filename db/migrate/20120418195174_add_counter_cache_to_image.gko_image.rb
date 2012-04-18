# This migration comes from gko_image (originally 20120124000000)
class AddCounterCacheToImage < ActiveRecord::Migration
  def up
    Image.reset_column_information
    Image.find_each do |u|
      Image.reset_counters u.id, :image_assignments
    end
  end  

  def down
  end
end