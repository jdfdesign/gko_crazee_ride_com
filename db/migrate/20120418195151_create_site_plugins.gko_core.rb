# This migration comes from gko_core (originally 20110828000000)
class CreateSitePlugins < ActiveRecord::Migration
  def self.up
    add_column :sites, :plugins, :text unless column_exists?(:sites, :plugins) 
  end

  def self.down
    remove_column :sites, :plugins
  end
end