class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :project_id
      t.integer :secretary_id
      t.date :date

      t.timestamps
    end
    add_index :records, [:project_id, :date]
  end
end
