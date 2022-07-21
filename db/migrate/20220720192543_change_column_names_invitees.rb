class ChangeColumnNamesInvitees < ActiveRecord::Migration[7.0]
  def change
    rename_column :Invitees, :user_id, :attendee_id
    rename_column :Invitees, :event_id, :attended_event_id
  end
end
