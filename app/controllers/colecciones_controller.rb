class ColeccionesController < ApplicationController
  # GET /coleccionistas
  # GET /coleccionistas.xml
  def index
    #muestra una lista de las colecciones
    @colecciones = Coleccion.order("nombre").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @colecciones }
    end    
  end
  
  # GET /Colecciones/1
  # GET /Colecciones/1.xml
  def show
    @coleccion = Coleccion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coleccion }
    end
  end

  # GET /Colecciones/new
  # GET /Colecciones/new.xml
  def new
    @coleccion = Coleccion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coleccion }
    end
  end

  # GET /Colecciones/1/edit
  def edit
    @coleccion = Coleccion.find(params[:id])
  end

  # POST /Colecciones
  # POST /Colecciones.xml
  def create
    @coleccion = Coleccion.new(params[:coleccion])

    respond_to do |format|
      if @coleccion.save
        update_menu_colecciones
        format.html { redirect_to(@coleccion, :notice => 'Coleccion was successfully created.') }
        format.xml  { render :xml => @coleccion, :status => :created, :location => @coleccion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coleccion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Colecciones/1
  # PUT /Colecciones/1.xml
  def update
    @coleccion = Coleccion.find(params[:id])

    respond_to do |format|
      if @coleccion.update_attributes(params[:Coleccion])
        format.html { redirect_to(@coleccion, :notice => 'Coleccion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coleccion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Colecciones/1
  # DELETE /Colecciones/1.xml
  def destroy
    @coleccion = Coleccion.find(params[:id])
    @coleccion.destroy

    respond_to do |format|
      format.html { redirect_to(colecciones_url) }
      format.xml  { head :ok }
    end
  end
  
  def set
    session[:coleccion_id]=params[:id] || 0
    if session[:coleccion_id].to_i > 0 then
      #tambien se debe llenar la lista de colecciones asociadas a este coleccionista
      update_menu_colecciones
    end
    
    redirect_to "/inicio"
  end
end
