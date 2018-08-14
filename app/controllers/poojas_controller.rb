class PoojasController < ApplicationController
  def index
    @poojas=Pooja.all.paginate(page: params[:page], per_page: 10)
  end
end
