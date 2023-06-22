class Comment < ApplicationRecord

belongs_to :user_new_events, optional: true 

validates_presence_of :user_new_event_id
validates_presence_of :body



has_many :users, through: :user_new_events
has_many :new_events, through: :user_new_events

end