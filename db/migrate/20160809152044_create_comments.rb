class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.string :priority

      t.integer :user_id
      t.integer :worksheet_id
      t.timestamps
    end

    add_index :comments, [:user_id, :worksheet_id]
    add_index :comments, :worksheet_id
  end
end
