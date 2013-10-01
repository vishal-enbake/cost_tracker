class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :client, :string
    add_column :projects, :amount, :float
    add_column :projects, :start_date, :date
    add_column :projects, :due_date, :date
    add_column :projects, :status, :string
  end
end
