class Profile < ActiveRecord::Base
  attr_accessible :name, :permissions

  validates :name, :permissions, presence: {message: "es un campo requerido."}
  validates :name, :uniqueness => {:message => "ya se encuentra registrado."}
  validates :permissions, :length => {:minimum => 3, :message => "Debe de elegir por lo menos un permiso de la lista"}
  validates :name, :length => {:maximum => 3, :message => "debe ser menor de 3 caracteres"}

  # Relacion entre modelos
  has_many :users

end
