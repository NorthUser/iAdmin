class ParticipantType < ActiveRecord::Base
  attr_accessible :name, :type_access, :pd_type_id

  validates :name, :type_access, presence: {message: "es un campo requerido."}
  validates :name, uniqueness: => {:message => "ya se encuentra registrado."}
  
  belongs_to :event_permission
  belongs_to :pd_type
end
