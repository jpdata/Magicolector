class Ubicacion < ActiveRecord::Base
  belongs_to :carta
  belongs_to :mazo
  
end
