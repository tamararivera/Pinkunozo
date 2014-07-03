class AddParentToMilestones < ActiveRecord::Migration
  def change
    add_reference :milestones, :parent
  end
end
