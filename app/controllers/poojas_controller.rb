class PoojasController < ApplicationController
  def index
    @poojas=Pooja.all
  end
end
