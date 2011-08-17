class CartasController < ApplicationController
  require 'net/http'
  
  def show
    unless params[:id].nil? then
      idcarta=params[:id]  
      coleccion = Coleccion.find session[:coleccion_id]
      @carta=coleccion.cartas.find idcarta
    else
      redirect_to :inicio
    end  
  end
  
  def index
    coleccion=Coleccion.find session[:coleccion_id]
    @cartas=coleccion.cartas.page(params[:page]).per(5)
  end
  
  #añade cartas al inventario
  def add
    unless params[:cantidad].nil? then
      @id = params[:id]
      @cantidad=params[:cantidad]
      coleccion = Coleccion.find session[:coleccion_id]
      carta = coleccion.cartas.where(:wocid=>@id).first
      unless carta.nil? then #sumando la cantidad a lo que ya existe
        carta.cantidad += @cantidad.to_i
        carta.save
      else
        carta = Carta.new(:wocid=>@id,:cantidad=>@cantidad)
        carta.save
        coleccion.cartas << carta
      end
      redirect_to "/cartas/#{carta.id}",:notice => 'Card was successfully addeed.'
    end
  end
  
  def buscaradd
    unless params[:search].nil? then
      #vamos a buscar en The Gatherer, todas la ocurrencias de un nombre de carta
      @resultado=searchGatherer("#{params[:search]}".split(/[^a-zA-Z]/))
    else
      @resultado=[]
    end
  end

  def buscar
    unless params[:search].nil? then
      #vamos a buscar en The Gatherer, todas la ocurrencias de un nombre de carta
      @resultado=searchGatherer("#{params[:search]}".split(/[^a-zA-Z]/))
    else
      @resultado=[]
    end
  end
  
  def searchGatherer(arregloNombre)
    #debemos hacer la búsqueda por nombre en gatherer
    urlbase="http://gatherer.wizards.com/Pages/Search/Default.aspx?output=spoiler&method=text&name="
    arregloNombre.each do |n|
      urlbase="#{urlbase}+[#{n}]"
    end
    r = Net::HTTP.get_response( URI.parse( urlbase ) )
    @url=urlbase
    if r.is_a? Net::HTTPOK #ok ok ok este caso funciona pero si solo hay una solución se redirige
      r.body.scan(/Name:[\s]*<\/td>[\s]*<td>[\s]*<a\s*id="[a-zA-Z0-9_]+"\s*class="nameLink"\s*onclick="return\s*CardLinkAction\(event,\s*this,\s*'SameWindow'\);"\s*href="\.\.\/Card\/Details\.aspx\?multiverseid=([0-9]+)">([-,'a-zA-Z\s]+)<\/a>/)
    else
      if r.is_a? Net::HTTPFound then #hay que hacer el regexp para este caso, probablemente dos scan, uno para id y otro para nombre
        #seguimos la redireccion 
        #multiverseid=([0-9]+)
        #http://gatherer.wizards.com
        newurl=r.body.scan(/href="(.*)"/)
        newurl="http://gatherer.wizards.com#{newurl[0][0]}"
        newurl.gsub!("%2f","/")
        newurl.gsub!("%3f","?")
        newurl.gsub!("%3d","=")
        @url=newurl
        
        r = Net::HTTP.get_response( URI.parse( newurl ) )
        #primera regex para obtener el id
        id=r.body.scan(/<img[\s]*src="\.\.\/\.\.\/Handlers\/Image\.ashx\?multiverseid=([0-9]+)&amp;type=card"/) 
        id=id[0][0]
        #segunda regexp para obtener el nombre
        nombre=r.body.scan(/Name:<\/div>[\s]*<div[\s]*class="value">[\s]*([-,'a-zA-Z\s]+)<\/div>/)
        nombre=nombre[0][0]
        to_res_array(id, nombre) #devolvemos el resultado en un array compatible
      else     
        @url="..."
        []
      end
    end
  end
  
 
  # devolvemos el resultado en un array compatible
  def to_res_array(id, nombre)
    [["#{id}",nombre]]
  end
  #new es mapeado a insertar una carta en el inventario para el coleccionist actual en la coleccion seleccionada
  #es simple porque una coleccion tiene n cartas pero una carta pertenece a una sola coleccion, y en una cantida dada
end
