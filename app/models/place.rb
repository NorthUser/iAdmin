class Place < ActiveRecord::Base
  attr_accessible :description, :name

  validates :desription, :name, presence: {message: "es un campo requerido."}
  validates :name, :uniqueness => {:message => "ya se encuentra registrado como usuario."}
  validates :name, :length => {:minimum => 6, :message => "debe contener minimo 6 caracteres"}
  validates :description, :length => {:minimum => 10, :message => "debe contener minimo 10 caracteres"}

end
