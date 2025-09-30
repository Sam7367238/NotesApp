class CreateRelatedNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :related_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
