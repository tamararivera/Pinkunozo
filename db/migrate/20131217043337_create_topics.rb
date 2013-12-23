class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :disussion
      t.integer :record_id

      t.timestamps
    end
  end
end
