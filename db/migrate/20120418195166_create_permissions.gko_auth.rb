# This migration comes from gko_auth (originally 20110828111111)
class CreatePermissions < ActiveRecord::Migration
  def up
    unless table_exists?(:groups)
      create_table :groups, :force => true do |t| 
        t.string :name 
        t.string :description 
        t.boolean :restricted
        t.timestamps
      end  
    end
    unless table_exists?(:permissions)
      create_table :permissions, :force => true do |t|
        t.string :plugin_name   
        t.string :path
        t.string :action
        t.boolean :restricted
        t.timestamps
      end 
    end
    unless table_exists?(:permission_groups)
      create_table :permission_groups, :force => true do |t|
        t.references :group 
        t.references :permission 
      end
      add_index :permission_groups, [:group_id, :permission_id]  
    end
    unless column_exists?(:users, :group_id)
      add_column :users, :group_id, :integer
      add_index :users, :group_id
    end
  end

  def down
    drop_table :permission_groups if table_exists?(:permission_groups)
    drop_table :groups if table_exists?(:groups)  
    drop_table :permissions if table_exists?(:permissions) 
    if column_exists?(:users, :group_id)
      remove_index :users, :group_id 
      remove_column :users, :group_id
    end
  end
end