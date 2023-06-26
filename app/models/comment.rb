class Comment < ApplicationRecord

belongs_to :user_new_event, optional: true 

validates_presence_of :user_new_event_id
validates_presence_of :body




has_many :new_events, through: :user_new_events


    def self.park_comments(park_id)
        park_comment_array = []
        park = NewPark.find_by(id: park_id)
        user_new_events = UserNewEvent.where(new_park_id: park_id)
    
        Comment.all.each do |comment|
          user_new_events.each do |event|
            if comment.user_new_event_id == event.id && event.new_park_id == park.id
                park_comment_array << comment
            end
          end
        end
        park_comment_array
    end
end