class MazosController < ApplicationController
  # GET /mazos
  # GET /mazos.xml
  def index
    if params[:mis_mazos]==true then
      @mazos = Mazo.where(["user_id=?",current_user.id]).page(params[:page]).per(5)
    else
      @mazos = Mazo.where(["coleccion_id=?", session[:coleccion_id].to_i]).page(params[:page]).per(5)
    end 
    @coleccionista=Coleccionista.find session[:coleccionista_id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mazos }
    end
  end

  # GET /mazos/1
  # GET /mazos/1.xml
  def show
    @mazo = Mazo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mazo }
    end
  end

  # GET /mazos/new
  # GET /mazos/new.xml
  def new
    @mazo = Mazo.new
    @coleccionista=Coleccionista.find session[:coleccionista_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mazo }
    end
  end

  # GET /mazos/1/edit
  def edit
    @mazo = Mazo.find(params[:id])
  end

  # POST /mazos
  # POST /mazos.xml
  def create
    @mazo = Mazo.new(params[:mazo])
    @mazo.user_id=current_user.id
    @mazo.coleccion_id=session[:coleccion_id]
    respond_to do |format|
      if @mazo.save
        update_menu_colecciones
        format.html { redirect_to(@mazo, :notice => 'Mazo was successfully created.') }
        format.xml  { render :xml => @mazo, :status => :created, :location => @mazo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mazo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mazos/1
  # PUT /mazos/1.xml
  def update
    @mazo = Mazo.find(params[:id])

    respond_to do |format|
      if @mazo.update_attributes(params[:mazo])
        format.html { redirect_to(@mazo, :notice => 'Mazo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mazo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mazos/1
  # DELETE /mazos/1.xml
  def destroy
    @mazo = Mazo.find(params[:id])
    @mazo.destroy

    respond_to do |format|
      format.html { redirect_to(mazos_url) }
      format.xml  { head :ok }
    end
  end
end
