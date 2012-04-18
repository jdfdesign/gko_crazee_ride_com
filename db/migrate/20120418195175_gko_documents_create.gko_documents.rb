# This migration comes from gko_documents (originally 20110311111112)
class GkoDocumentsCreate < ActiveRecord::Migration
  def self.up
    unless table_exists?(:documents)
      create_table :documents do |t|
        t.string :title, :limit => 100
        t.string :lang, :limit => 4
        t.string :alt
        t.references :account
        t.references :site
        t.integer :document_assignments_count, :default => 0
        t.timestamps

        t.string :document_mime_type
        t.string :document_name
        t.integer :document_size
        t.string :document_uid
        t.string :document_ext
      end

      create_table :document_assignments do |t|
        t.integer :position, :null => false, :default => 1
        t.references :document, :null => false
        t.integer :attachable_id, :null => false
        t.string :attachable_type, :null => false, :limit => 40
        t.timestamps
      end

      add_index :document_assignments, [:attachable_id, :attachable_type]
    end
  end

  def self.down
    drop_table :documents
    drop_table :document_assignments
  end
end
