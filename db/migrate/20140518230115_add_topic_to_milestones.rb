class AddTopicToMilestones < ActiveRecord::Migration
  def change
    change_table :milestones do |t|
      t.belongs_to :topic
    end
  end
end
