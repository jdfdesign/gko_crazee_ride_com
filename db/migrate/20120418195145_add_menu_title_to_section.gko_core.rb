# This migration comes from gko_core (originally 20110720000000)
class AddMenuTitleToSection < ActiveRecord::Migration
  def up
    unless column_exists?(:sections, :menu_title)
      add_column :sections, :menu_title, :string
      add_column :section_translations, :menu_title, :string
    end
  end

  def down
    remove_column :sections, :menu_title
    remove_column :section_translations, :menu_title
  end
end
