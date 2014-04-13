class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :discussion
      t.integer :record_id

      t.timestamps
    end
    add_index :topics, [:record_id]
  end
end
