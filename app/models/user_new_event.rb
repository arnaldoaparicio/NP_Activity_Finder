class UserNewEvent < ApplicationRecord

    validates_presence_of :user_id
    validates_presence_of :new_event_id

    belongs_to :user
    belongs_to :new_event

end