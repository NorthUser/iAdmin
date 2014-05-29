class Event < ActiveRecord::Base
  attr_accessible :date, :event_type_id, :place_id, :summary, :title

  belongs_to :event_type
  belongs_to :place
  has_many :event_permissions
  has_many :documents


end
