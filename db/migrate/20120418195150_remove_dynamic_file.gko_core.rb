# This migration comes from gko_core (originally 20110824111111)
class RemoveDynamicFile < ActiveRecord::Migration
  def up
    drop_table :dynamic_files if table_exists?(:dynamic_files)
     
  end

  def down
    
  end
end