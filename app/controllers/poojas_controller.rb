class PoojasController < ApplicationController
  def index
    @poojas=Pooja.all.paginate(page: params[:page], per_page: 10)
  end

  def pooja
    if params[:id]
      @pooja=Pooja.find(params[:id])
      @order=Order.new
      #@address=CustomerAddress.new
    else
      flash[:error]="Pooja not Found!!!"
    end
  end
end
