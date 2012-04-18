# This migration comes from gko_inquiries (originally 20110824000000)
class CreateMailMethod < ActiveRecord::Migration
  def change
    unless table_exists?(:mail_methods)
      create_table :mail_methods do |t|
        t.references :site
        t.string :environment
        t.boolean :active, :default => true 
        t.boolean :enable_mail_delivery, :default => true
        t.string :mail_host
        t.string :mail_domain
        t.integer :mail_port, :default => 25 
        t.string :mail_auth_type
        t.string :smtp_username
        t.string :smtp_password
        t.string :secure_connection_type
        t.string :mails_from
        t.string :mail_bcc 
        t.string :intercept_email
        t.timestamps
      end
    end   
  end
  
  def down
    drop_table :mail_methods
  end
end