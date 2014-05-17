class ChangeColumnTypeOfDiscussionOfTopics < ActiveRecord::Migration
  def change
    change_column :topics, :discussion, :text
  end
end
