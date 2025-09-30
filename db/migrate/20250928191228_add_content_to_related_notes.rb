class AddContentToRelatedNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :related_notes, :content, :text
  end
end
