class CreateNewParks < ActiveRecord::Migration[5.2]
  def change
    create_table :new_parks do |t|
      t.string :name
      t.string :description
      t.string :park_code
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :email
      t.string :entrance_fees, array: true, default: []
      t.string :directions_website
      t.string :closed_day
      t.string :operating_hours, array: true, default: []
      t.string :address
      t.string :photos, array: true, default: []
    end
  end
end
