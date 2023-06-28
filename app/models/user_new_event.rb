class UserNewEvent < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :new_event_id
  validates_presence_of :new_park_id
  validates_presence_of :date_attend, allow_nil: true

  belongs_to :user
  belongs_to :new_event, dependent: :destroy
  belongs_to :new_park

  has_many :comments, dependent: :destroy
 
end

