class PdType < ActiveRecord::Base
  attr_accessible :document_id, :participant_id

  validates :document_id, :participant_id, presence: {message: "es un campo requerido."}
  validates :document_id, :participant_id, :numericality => {:only_integer => true, :message => "solo acepta valores enteros."}
  validates :participant_id, uniqueness: {scope: [:document_id]}

  has_many :participant_types
  has_many :documents
end
