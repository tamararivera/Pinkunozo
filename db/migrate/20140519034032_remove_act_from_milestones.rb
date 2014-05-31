class RemoveActFromMilestones < ActiveRecord::Migration
  def change
    remove_column :milestones, :act_id, :integer
  end
end
