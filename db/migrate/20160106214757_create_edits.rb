class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
