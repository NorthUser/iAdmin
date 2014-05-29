class Profile < ActiveRecord::Base
  attr_accessible :name, :permissions

  # Relacion entre modelos
  has_many :users

end
