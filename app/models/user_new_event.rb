class UserNewEvent < ApplicationRecord

    validates_presence_of :user_id
    validates_presence_of :new_event_id
    validates_presence_of :new_park_id

    belongs_to :user
    belongs_to :new_event
    belongs_to :new_park

end