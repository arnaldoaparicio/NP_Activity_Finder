class CreateNewEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :new_events do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :date, default: [], array: true
      t.string :time, default: [], array: true
      t.string :free
      t.string :event_code
      t.string :fee_info
      t.float :latitude
      t.float :longitude
      t.string :type, default: [], array: true
    end
  end
end
