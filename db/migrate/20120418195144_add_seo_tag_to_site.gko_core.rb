# This migration comes from gko_core (originally 20110716000000)
class AddSeoTagToSite < ActiveRecord::Migration
  def up
    unless column_exists?(:sites, :meta_title)
      add_column :sites, :meta_title, :string
      add_column :site_translations, :meta_title, :string
    end
  end

  def down
    remove_column :site_translations, :meta_title
    remove_column :sites, :meta_title
  end
end
