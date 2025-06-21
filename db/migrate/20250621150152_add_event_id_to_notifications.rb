class AddEventIdToNotifications < ActiveRecord::Migration[8.0]
  def change
    add_column :notifications, :event_id, :string
    add_index :notifications, :event_id
  end
end
