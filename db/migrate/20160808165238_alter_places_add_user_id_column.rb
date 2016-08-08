class AlterPlacesAddUserIdColumn < ActiveRecord::Migration
  def change
    add_column :worksheets, :user_id, :integer
    add_index :worksheets, :user_id
  end
end
