# This migration comes from gko_auth (originally 20110311000002)
class GkoCmsCreateUsers < ActiveRecord::Migration
  def up
    unless table_exists?(:users)
      create_table :users, :force => true do |t|
        t.references :account
        ## devise
        ## Database authenticatable
        t.string :email, :null => false, :default => ""
        t.string :encrypted_password, :null => false, :limit => 128, :default => ""
        t.string :confirmation_token
        t.datetime :confirmed_at
        t.datetime :confirmation_sent_at
        ## Recoverable
        t.string   :reset_password_token
        t.string :remember_token
        ## Rememberable
        t.datetime :remember_created_at
      
        ## Trackable
        t.integer  :sign_in_count
        t.datetime :current_sign_in_at
        t.datetime :last_sign_in_at
        t.string   :current_sign_in_ip
        t.string   :last_sign_in_ip
      
        ## end devise 

        t.string :roles
        t.string :username, :limit => 60
        t.string :firstname, :limit => 60
        t.string :lastname, :limit => 60
        t.string :preferred_language, :limit => 5
        t.string :timezone
        t.integer :site_registrations_count, :default => 0
        t.timestamps
      end
    end
    unless column_exists?(:sites, :site_registrations_count)
      add_column :sites, :site_registrations_count, :integer, :default => 0
    end
    unless table_exists?(:site_registrations)
      create_table :site_registrations, :force => true do |t| 
        t.integer :user_id
        t.integer :site_id
      end
      add_index :site_registrations, [:user_id, :site_id]
    end 
  end

  def down
    remove_column :sites, :site_registrations_count if column_exists?(:sites, :site_registrations_count)
    drop_table :users  if table_exists?(:users)
    drop_table :site_registrations if table_exists?(:site_registrations)
  end
end