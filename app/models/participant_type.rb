class ParticipantType < ActiveRecord::Base
  attr_accessible :name, :type_access, :pd_type_id

  belongs_to :event_permission
  belongs_to :pd_type
end
