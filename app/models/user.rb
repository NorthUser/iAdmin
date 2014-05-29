class User < ActiveRecord::Base
  attr_accessible :email, :password, :person_id, :username, :profile_id

   #Relacion de modelos
  belongs_to :person
  belongs_to :profile
  has_many :event_permissions

end
