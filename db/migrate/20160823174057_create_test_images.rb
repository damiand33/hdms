class CreateTestImages < ActiveRecord::Migration
  def change
    create_table :test_images do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
