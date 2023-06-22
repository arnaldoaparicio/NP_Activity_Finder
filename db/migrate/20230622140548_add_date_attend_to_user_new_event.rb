class AddDateAttendToUserNewEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :user_new_events, :date_attend, :string
  end
end
