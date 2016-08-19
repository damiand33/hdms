class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :caption
      t.integer :worksheet_id

      t.timestamps
    end
  end
end
