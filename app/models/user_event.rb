class UserEvent < ApplicationRecord

    validates_presence_of :user_id
    validates_presence_of :event_id
    validates_presence_of :park_id

    belongs_to :user
    belongs_to :park
    belongs_to :event

end