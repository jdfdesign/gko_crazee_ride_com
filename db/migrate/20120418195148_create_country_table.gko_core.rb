# This migration comes from gko_core (originally 20110803000000)
class CreateCountryTable < ActiveRecord::Migration
  def up  
    unless table_exists?(:countries) 
        create_table :countries, :force => true do |t|
        t.string :iso_name 
        t.string :iso3, :limit => 3
        t.string :iso, :limit => 2
        t.string :name
        t.integer :numcode, :limit => 4
        t.timestamps
      end
    end 
  end

  def down
    drop_table :countries
  end
end