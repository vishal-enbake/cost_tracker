class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :name
      t.references :division

      t.timestamps
    end
    add_index :receipts, :division_id
  end
end
