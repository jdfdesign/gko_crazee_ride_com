# This migration comes from gko_core (originally 20120127114322)
class AddPositionToContent < ActiveRecord::Migration
  def up
    unless column_exists?(:contents, :position)
      add_column :contents, :position, :integer, :default => 1
      add_index :contents, [:position, :section_id]
      Site.all.each do |site|
        site.sections.all do |section|
          if section.content_type.present?
            contents = section.send(:"#{section.content_type.pluralize.underscore}")
            if contents.try(:any?)
              contents.each_with_index do |content, index|
                content.insert_at(index)
              end
            end
          end
        end
      end
    end 
  end

  def down
    remove_index :contents, [:position, :section_id] 
    remove_column :contents, :position
  end
end