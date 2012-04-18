# This migration comes from gko_features (originally 20111228111111)
class GlobalizeFeatures < ActiveRecord::Migration
  def up
    unless table_exists?(:feature_translations)
      Feature.create_translation_table!({
      :title => :string,
      :body => :text
    }, {:migrate_data => true})
    end
  end

  def down
    Feature.drop_translation_table! :migrate_data => true
  end
end
