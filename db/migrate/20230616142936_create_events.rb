class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :date, array: true, default: []
      t.string :time
      t.string :free
      t.string :event_code
      t.string :fee_info
      t.float :latitude
      t.float :longitude
      t.string :type, array: true, default: []
    end
  end
end
