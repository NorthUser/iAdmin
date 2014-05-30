class Person < ActiveRecord::Base
  attr_accessible :academic_degree, :biography, :last_name, :membership, :name, :person_type_id, :second_last_name

  validates :academic_degree, :biography, :last_name, :membership, :name, :person_type_id, :second_last_name, presence: {message: "es un campo requerido."}
  validates :person_type_id, :numericality => {:only_integer => true, :message => "Elija uno de la lista."}
  validates :name, uniqueness: {scope: [:last_name, :second_last_name]}
  validates :name, :last_name, :second_last_name, length: {minimum: 3, :message => "debe contener minimo 3 caracteres"}

  def full_name
  	[name, last_name, second_last_name].join(' ')
  end

  def initials
  	initials = name[0]
  	initials += last_name[0]
  	initials += second_last_name[0]
  end

  has_one :user
  belongs_to :person_type

end
