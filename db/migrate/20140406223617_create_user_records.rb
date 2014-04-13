class CreateUserRecords < ActiveRecord::Migration
  def change
    create_table :user_records do |t|
      t.integer :user_id
      t.integer :act_id

      t.timestamps
    end
    add_index :user_records, :user_id
    add_index :user_records, :act_id
    add_index :user_records, [:user_id, :act_id], unique: true
  end
end
