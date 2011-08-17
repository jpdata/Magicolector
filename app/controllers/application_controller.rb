class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :set_locale
 
  def set_locale
    I18n.locale = "es" #params[:locale] || I18n.default_locale
  end
  
  def update_menu_coleccionistas
    if user_signed_in? then
      user=current_user
      coleccionistas = user.coleccionistas.all.map do |c| 
        [c.nombre,"/coleccionistas/set/#{c.id}"]  
      end
#    items_menu=[
#    ["Inicio","/",[]],
#    ["Coleccionistas","/coleccionistas",coleccionistas],
#    ["Colecciones","/colecciones",[]]]
#    session["items_menu"]=items_menu
      session["items_menu"][1][2]=coleccionistas
    end
  end
  
  def update_menu_colecciones
    if user_signed_in? then
      colecciones = Coleccion.find(:all, :conditions=>["coleccionista_id=?",session[:coleccionista_id]]).map do |c|
        [c.nombre,"/colecciones/set/#{c.id}"]
      end
#    items_menu=[
#    ["Inicio","/",[]],
#    ["Coleccionistas","/coleccionistas",coleccionistas],
#    ["Colecciones","/colecciones",[]]]
#    session["items_menu"]=items_menu
      session["items_menu"][2][2]=colecciones
      session["items_menu"] = session["items_menu"][0..2]
      session["items_menu"] << ["Mazos","/mazos",Mazo.where(["coleccion_id=?",session[:coleccion_id]]).map{|m| [m.nombre,"/mazos/#{m.id}"]}]
    end
  end
  
end
