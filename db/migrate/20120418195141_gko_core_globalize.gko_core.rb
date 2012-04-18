# This migration comes from gko_core (originally 20110326000000)
class GkoCoreGlobalize < ActiveRecord::Migration
  def up
    unless table_exists?(:site_translations) 
      Site.create_translation_table!({   :meta_title => :string, 
                                         :title => :string,
                                         :subtitle => :string
                                     }, {:migrate_data => true}) 
    end
    unless column_exists?(:sections, :menu_title)
      add_column :sections, :menu_title, :string
    end
    unless table_exists?(:section_translations)                              
      Section.create_translation_table!({
                                            :title => :string,
                                            :body => :text,
                                            :meta_title => :string,
                                            :meta_description => :text,
                                            :meta_keywords => :text,
                                            :slug => :string,
                                            :path => :string,
                                            :redirect_url => :string,
                                            :title_addon => :string,
                                            :menu_title => :string
                                        }, {:migrate_data => true})  
    end
    unless table_exists?(:content_translations)
      Content.create_translation_table!({
                                          :title => :string,
                                          :body => :text,
                                          :meta_title => :string,
                                          :meta_description => :text,
                                          :meta_keywords => :text,
                                          :slug => :string
                                      }, {:migrate_data => true})
    end
  end

  def down
    Site.drop_translation_table! :migrate_data => true if table_exists?(:site_translations) 
    Section.drop_translation_table! :migrate_data => true if table_exists?(:section_translations) 
    Content.drop_translation_table! :migrate_data => true if table_exists?(:content_translations) 
  end
end
