class PdType < ActiveRecord::Base
  attr_accessible :document_id, :participant_id

  has_many :participant_types
  has_many :documents
end
