# This migration comes from gko_inquiries (originally 20110421163652)
class GkoInquiryCreateTables < ActiveRecord::Migration
  def up
    unless table_exists?(:inquiries)
      create_table :inquiries do |t|
        t.string :type
        t.string :confirmation_code, :limit => 40
        t.string   :to_email
        t.string   :name
        t.string   :email
        t.string   :phone
        t.text     :message
        t.boolean  :open,       :default => true
        t.datetime :created_at
        t.datetime :updated_at
        t.datetime :confirmed_at
        t.boolean  :spam,       :default => false
        t.text     :options
        t.references :site
      end
    end 
  end
  
  def down
     drop_table :inquiries
  end
end