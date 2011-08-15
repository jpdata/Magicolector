class Coleccion < ActiveRecord::Base
  belongs_to :coleccionista
  has_many :carta
  
end
