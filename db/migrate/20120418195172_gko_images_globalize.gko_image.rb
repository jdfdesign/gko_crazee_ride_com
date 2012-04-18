# This migration comes from gko_image (originally 20110326444444)
class GkoImagesGlobalize < ActiveRecord::Migration
  def up
    unless table_exists?(:image_translations)
      Image.create_translation_table!({
        :title => :string,
        :alt => :text
      }, {:migrate_data => true})
    end   
  end

  
  def down
    Image.drop_translation_table! :migrate_data => true
  end
end
