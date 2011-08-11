class AdminController < ApplicationController
  def index
    @unapproveds=User.find :all,:conditions=>["approved=?",false]
  end
  
  def aprobar
    if(params[:id]) then
      @aprobado=User.find params[:id]
      @aprobado.approved=true
      @aprobado.save
    end
  end
end
