class InicioController < ApplicationController
  def index
    #cargar los coleccionistas a los que está adscrito esl usuairo actual
    update_menu_coleccionistas
    if session[:coleccionista_id] and session[:coleccionista_id].to_i > 0 then
      @coleccionista=Coleccionista.find session[:coleccionista_id]
    end
  end

end
