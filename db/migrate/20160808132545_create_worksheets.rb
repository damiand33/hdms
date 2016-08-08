class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.string :piw_id
      t.string :submitted_by
      t.text  :description    
      t.timestamps
    end
  end
end
