class Carta < ActiveRecord::Base
  belongs_to :coleccion
  has_many :ubicaciones
  has_many :mazos, :through=>:ubicaciones
  
  validates_presence_of :cantidad
  validates_numericality_of :cantidad
  
  def label
    "#{self.wocid}"
  end
end
