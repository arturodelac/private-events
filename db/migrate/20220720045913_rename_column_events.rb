class RenameColumnEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :Events, :user_id, :creator_id
  end
end
