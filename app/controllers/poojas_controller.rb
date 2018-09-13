class PoojasController < ApplicationController
  before_action :authenticate_user!, only: ["pooja","index"]
  #before_action :RoleBasedAction.call(current_user, "pooja")
  require 'user/role'
  def index
    #update
    if current_user.email_confirmed
      if current_user.user_type=='p'
        redirect_to pandits_path
      else
        @poojas=Pooja.all.paginate(page: params[:page], per_page: 10)
      end
    else
      redirect_to emails_verifyemail_path
    end
  end

  def pooja
    begin
      if params[:id]
        @pooja=Pooja.find(params[:id])
        @order=Order.new
        #@address=CustomerAddress.new
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to poojas_index_path
      #render partial: "errors/_404" to redirect to 404 page
      return
    end
  end

end
