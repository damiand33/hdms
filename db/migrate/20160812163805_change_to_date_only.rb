class ChangeToDateOnly < ActiveRecord::Migration
  def change
    change_column :worksheets, :date_opened, :date
    change_column :worksheets, :date_closed, :date
  end
end
