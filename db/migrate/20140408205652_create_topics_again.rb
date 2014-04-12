class CreateTopicsAgain < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :discussion
      t.belongs_to :record

      t.timestamps
    end
  end
end