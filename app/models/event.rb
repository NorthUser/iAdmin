class Event < ActiveRecord::Base
  attr_accessible :date, :event_type_id, :place_id, :summary, :title

  validates :date, :event_type_id, :place_id, :summary, :title, presence: {message: "es un campo requerido."}
  validates :event_type_id, :place_id, :numericality => {:only_integer => true, :message => "Elija solo valores de la lista."}
  validates :title, uniqueness: {scope: [:date, :place_id]}

  belongs_to :event_type
  belongs_to :place
  has_many :event_permissions
  has_many :documents


end
