class Coleccion < ActiveRecord::Base
  belongs_to :coleccionista
  has_many :cartas
  has_many :mazos
  
  def label
    "#{self.nombre}"
  end
end
