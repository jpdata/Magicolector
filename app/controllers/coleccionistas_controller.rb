class ColeccionistasController < ApplicationController
  # GET /coleccionistas
  # GET /coleccionistas.xml
  def index

    @coleccionistas = Coleccionista.order("nombre").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coleccionistas }
    end
  end

  # GET /coleccionistas/1
  # GET /coleccionistas/1.xml
  def show
    @coleccionista = Coleccionista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coleccionista }
    end
  end

  # GET /coleccionistas/new
  # GET /coleccionistas/new.xml
  def new
    @coleccionista = Coleccionista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coleccionista }
    end
  end

  # GET /coleccionistas/1/edit
  def edit
    @coleccionista = Coleccionista.find(params[:id])
  end

  # POST /coleccionistas
  # POST /coleccionistas.xml
  def create
    @coleccionista = Coleccionista.new(params[:coleccionista])

    respond_to do |format|
      if @coleccionista.save
        
        @coleccionista.users << current_user
        @coleccionista.save
        
        format.html { redirect_to(@coleccionista, :notice => 'Coleccionista was successfully created.') }
        format.xml  { render :xml => @coleccionista, :status => :created, :location => @coleccionista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coleccionista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coleccionistas/1
  # PUT /coleccionistas/1.xml
  def update
    @coleccionista = Coleccionista.find(params[:id])

    respond_to do |format|
      if @coleccionista.update_attributes(params[:coleccionista])
        
        format.html { redirect_to(@coleccionista, :notice => 'Coleccionista was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coleccionista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coleccionistas/1
  # DELETE /coleccionistas/1.xml
  def destroy
    @coleccionista = Coleccionista.find(params[:id])
    @coleccionista.destroy

    respond_to do |format|
      format.html { redirect_to(coleccionistas_url) }
      format.xml  { head :ok }
    end
  end
  
  def usuarios
    @coleccionista = Coleccionista.find(params[:id])
    
  end
  
  def quitar
    @coleccionista = Coleccionista.find(params[:id])
    @coleccionista.users.delete(User.find params[:uid])
    redirect_to "/coleccionistas/usuarios/#{@coleccionista.id}"
  end
  
  def agregar # coleccionista/agregar/
#    if(params[:uid]) then
      @coleccionista = Coleccionista.find(params[:id])
      @coleccionista.users << User.find(params[:coleccionista][:tuid])
      @coleccionista.save
      update_menu_colectionistas
      redirect_to "/coleccionistas/usuarios/#{@coleccionista.id}"
#    end
  end
  
  def set
    session[:coleccionista_id]=params[:id] || 0
    if session[:coleccionista_id].to_i > 0 then
      #tambien se debe llenar la lista de colecciones asociadas a este coleccionista
      update_menu_colecciones
    end
    
    redirect_to "/inicio"
  end
end
