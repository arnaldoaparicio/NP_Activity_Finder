class RenameTypeToTypeOfEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :new_events, :type, :type_of_event
  end
end
