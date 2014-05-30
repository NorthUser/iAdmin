class User < ActiveRecord::Base
  attr_accessible :email, :password, :person_id, :username, :profile_id

  validates :email, :password, :person_id, :username, :profile_id, presence: {message: "es un campo requerido."}
  validates :person_id, :profile_id, :numericality => {:only_integer => true, :message => "solo acepta valores enteros."}
  validates :username, :uniqueness => {:message => "ya se encuentra registrado como usuario."}
  validates :password, :length => {:minimum => 6, :message => "debe contener minimo 6 caracteres"}
  validates :password, :length => {:maximum => 15, :message => "debe ser menor de 15 caracteres"}

   #Relacion de modelos
  belongs_to :person
  belongs_to :profile
  has_many :event_permissions

end
