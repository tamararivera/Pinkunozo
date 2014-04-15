class RenameTypeInMilestones < ActiveRecord::Migration
  def change
    change_table :milestones do |t|
      t.rename :type, :type_of_milestone
    end
  end
end
