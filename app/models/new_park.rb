class NewPark < ApplicationRecord

    validates_presence_of :name, allows_nil: true
    validates_presence_of :description, allows_nil: true
    validates_presence_of :park_code, allows_nil: true
    validates_presence_of :latitude, allows_nil: true
    validates_presence_of :longitude, allows_nil: true
    validates_presence_of :phone_number, allows_nil: true
    validates_presence_of :email, allows_nil: true
    validates_presence_of :entrance_fees, allows_nil: true
    validates_presence_of :directions_website, allows_nil: true
    validates_presence_of :closed_day, allows_nil: true
    validates_presence_of :operating_hours, allows_nil: true
    validates_presence_of :address, allows_nil: true
    validates_presence_of :photos, allows_nil: true

    # has_many :user_events
    # has_many :events, through: :user_events
    




end