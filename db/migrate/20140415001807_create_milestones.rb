class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.string :description
      t.date   :date_of_creation

      t.belongs_to :act

      t.belongs_to :user

      t.timestamps
    end
  end
end
