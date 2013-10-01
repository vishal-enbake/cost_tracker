class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.float :amount
      t.references :division

      t.timestamps
    end
    add_index :invoices, :division_id
  end
end
