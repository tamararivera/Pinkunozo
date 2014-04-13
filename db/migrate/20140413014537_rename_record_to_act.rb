class RenameRecordToAct < ActiveRecord::Migration
  def change
    rename_table :records, :acts
  end
end
