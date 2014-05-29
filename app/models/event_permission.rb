class EventPermission < ActiveRecord::Base
  attr_accessible :event_id, :participant_type_id, :user_id

  belongs_to :event
  belongs_to :participant_type
  belongs_to :user
end
