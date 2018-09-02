class OrdersController < ApplicationController

  def allowed_params
    params.require(:order).permit(:Book_time,:Book_date,:pooja_id,:Book_status,:user_id,:address)
  end

  def create
    @order=Order.create(allowed_params)
    if @order
      flash[:success]="Order placed successfully"
      #payment gateway call
      redirect_to poojas_index_path
    else
      puts "error"
      flash[:notice]="Something went wrong!!!"
    end
  end

  def new
  end

  def show
    @orders=Order.orders_by_user(current_user.id)
  end
end
