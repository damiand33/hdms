class AddFieldsToWorksheet < ActiveRecord::Migration
  def change
    add_column :worksheets, :pre_load, :string
    add_column :worksheets, :module, :string
    add_column :worksheets, :date_opened, :datetime
    add_column :worksheets, :incident_report_number, :string
    add_column :worksheets, :description_as_is, :text
    add_column :worksheets, :description_to_be, :text
    add_column :worksheets, :impact, :string
    add_column :worksheets, :requested_by, :string
    add_column :worksheets, :action_taken, :text
    add_column :worksheets, :action_taken_by, :string
    add_column :worksheets, :date_closed, :datetime
  end
end
