class AddStatusField < ActiveRecord::Migration
  def change
    add_column :worksheets, :status, :string
  end
end
