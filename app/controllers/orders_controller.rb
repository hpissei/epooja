class OrdersController < ApplicationController
before_action :authenticate_user!
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

  def index
    @orders=Order.orders_by_user(current_user.id)
  end

  def show
    #not called so to think what needs to be done
    @orders=Order.orders_by_user(current_user.id)
    puts "sdfsafas fdsfsfa  #{@orders.inspect}"
    if @orders.all.count<1
      redirect_to orders_path
    end
  end

  def destroy
    order=Order.find params[:id]
    if order
      order.Book_status='d'
      place_bid = PlaceBid.find_by order_id: order.id
      if place_bid!=nil
          place_bid.bid_status='d'
          place_bid.save
      end
      order.save
      redirect_to order_path
    else
      puts "not found"
    end
  end

end
