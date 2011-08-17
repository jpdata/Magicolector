class Mazo < ActiveRecord::Base
  has_many :ubicaciones
  has_many :cartas, :through => :ubicaciones
  belongs_to :coleccion
  belongs_to :user
  
  def label
    "#{self.nombre}"
  end  
end
