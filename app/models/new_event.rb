class NewEvent < ApplicationRecord
  validates_presence_of :location, allow_nil: true
  validates_presence_of :description, allow_nil: true
  validates_presence_of :name, allow_nil: true
  validates_presence_of :date, allow_nil: true
  validates_presence_of :time, allow_nil: true
  validates_presence_of :free, allow_nil: true
  validates_presence_of :event_code, allow_nil: true
  validates_presence_of :fee_info, allow_nil: true
  validates_presence_of :latitude, allow_nil: true
  validates_presence_of :longitude, allow_nil: true
  validates_presence_of :type_of_event, allow_nil: true

  has_many :user_new_events
  has_many :users, through: :user_new_events
  has_many :comments, through: :user_new_events, dependent: :destroy  
end
