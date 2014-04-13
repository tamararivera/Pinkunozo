class CreateTopicsAgain < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :discussion
      t.belongs_to :act

      t.timestamps
    end
  end
end