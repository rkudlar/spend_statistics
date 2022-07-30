class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.float :cost, null: false
      t.date :date, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
