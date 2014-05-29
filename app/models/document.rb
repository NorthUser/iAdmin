class Document < ActiveRecord::Base
  attr_accessible :type_attribute, :event_id, :title, :url, :pd_type_id

  belongs_to :pd_type
  belongs_to :event
end
