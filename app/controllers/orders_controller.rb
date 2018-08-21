class OrdersController < ApplicationController

  def allowed_params
    params.require(:order).permit(:Book_time,:Book_date,:Pooja_id,:Book_status,:User_id)
  end

  def create
    @order=Order.create(allowed_params)
    if @order
      flash[:success]="Order placed successfully"
    else
      puts "error"
      flash[:notice]="Something went wrong!!!"
    end
  end

  def new
  end

end
