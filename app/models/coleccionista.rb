class Coleccionista < ActiveRecord::Base

  
  has_and_belongs_to_many :users
  has_many :coleccion
  
  attr_accessor :tuid

  def label
    "#{self.nombre}"
  end
end
