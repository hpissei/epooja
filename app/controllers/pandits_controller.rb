class PanditsController < ApplicationController
  before_action :getOrders, only: [:index]

  def allowed_params_bid
    puts ">>>>>>>>>> #{params.inspect}"
    params.permit(:pooja_id, :order_id, :user_id, :bid_status)#:bid_placed_at_datetime
  end

  def getOrders
    @orders=Order.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @orders=getOrders#Orders.all
    @place_bid=PlaceBid.new
  end

  def place_bid
    #algorithm call for assigning pandit
    #puts ">>>>>>>>>>>>>>>>>>>>>>>place_bid "
    @place_bid=PlaceBid.new #create(allowed_params_bid)
    @place_bid.user_id = params[:pandit_id]
    @place_bid.order_id = params[:order_id]
    #@place_bid.pooja_id = params[:pooja_id]
    @place_bid.bid_status = 'a'
    @place_bid.placed_at_datetime=Time.now

    if params[:order_id] && params[:pandit_id]
      puts ">>>>>>>>>>>>>>>>order id #{params[:order_id]} and pandit_id :#{params[:pandit_id]} time#{Time.now}"
      if @place_bid.save
          flash[:notice] = "Successfully created..."
          puts ">>>>>>>>>>>>> success"
      end
    else
          flash[:error]="Something went wrong please try again!!!"
          puts ">>>>>>>>>>>>>>>>>>failed"
    end
  end

end
