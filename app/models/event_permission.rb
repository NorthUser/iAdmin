class EventPermission < ActiveRecord::Base
  attr_accessible :event_id, :participant_type_id, :user_id

  validates :event_id, :participant_type_id, :user_id, presence: {message: "es un campo requerido."}
  validates :event_id, :participant_type_id, :user_id, :numericality => {:only_integer => true, :message => "Elija solo valores de la lista."}
  validates :event_id, uniqueness: {scope: [:user_id]}

  belongs_to :event
  belongs_to :participant_type
  belongs_to :user
end
