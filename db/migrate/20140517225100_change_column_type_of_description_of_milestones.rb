class ChangeColumnTypeOfDescriptionOfMilestones < ActiveRecord::Migration
  def change
      change_column :milestones, :description, :text
  end
end
