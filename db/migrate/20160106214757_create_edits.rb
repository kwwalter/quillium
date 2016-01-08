class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :content, null: false
      t.references :user, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
