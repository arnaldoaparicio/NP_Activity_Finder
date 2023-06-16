class Event < ApplicationRecord
    validates_presence_of :location
    validates_presence_of :description
    validates_presence_of :name
    validates_presence_of :date
    validates_presence_of :time
    validates_presence_of :free
    validates_presence_of :event_code
    validates_presence_of :fee_info
    validates_presence_of :latitude
    validates_presence_of :longitude
    validates_presence_of :type

    # has_many :user_events
    # has_many :users, through: :user_events
   

end