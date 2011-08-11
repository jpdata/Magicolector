class ColeccionesController < ApplicationController
  def index
    #muestra una lista de las colecciones
    @colecciones = Coleccion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @colecciones }
    end    
  end
  
  def new
    #crea una nueva coleccion
  end
end
