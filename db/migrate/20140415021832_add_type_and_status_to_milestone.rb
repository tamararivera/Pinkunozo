class AddTypeAndStatusToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :type, :string
    add_column :milestones, :status, :string
  end
end
