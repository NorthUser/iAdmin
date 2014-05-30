class PersonType < ActiveRecord::Base
  attr_accessible :category, :public, :role

  validates :category, :public, :role, presence: {message: "es un campo requerido."}
  validates :role, :uniqueness => {:message => "ya se encuentra registrado."}
  validates :permissions, :length => {:minimum => 3, :message => "Debe de elegir por lo menos un permiso de la lista"}
  validates :name, :length => {:maximum => 3, :message => "debe ser menor de 3 caracteres"}
end
