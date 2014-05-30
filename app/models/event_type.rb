class EventType < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: {message: "es un campo requerido."}
  validates :name, :uniqueness => {:message => "ya se encuentra registrado."}

  has_many :events
end
