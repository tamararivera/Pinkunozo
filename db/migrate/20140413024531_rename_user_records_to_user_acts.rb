class RenameUserRecordsToUserActs < ActiveRecord::Migration
  def change
    rename_table :user_records, :user_acts
  end
end
