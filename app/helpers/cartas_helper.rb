module CartasHelper
  def find_card_name_by_id(id)
    url="http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=#{id}"
    
    r = Net::HTTP.get_response( URI.parse( url ) )
    #segunda regexp para obtener el nombre
    nombre=r.body.scan(/Name:<\/div>[\s]*<div[\s]*class="value">[\s]*([_',a-zA-Z\s]+)<\/div>/)
    nombre[0][0] #devolvemos el resultado en un array compatible
  
  end
end
