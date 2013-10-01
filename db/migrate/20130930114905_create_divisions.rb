class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :project

      t.timestamps
    end
    add_index :divisions, :project_id
  end
end
