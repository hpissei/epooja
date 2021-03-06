class PanditsController < ApplicationController
  require 'user/role'
  before_action :getOrders, only: [:index]
  before_action :authenticate_user!

  def allowed_params_bid
    params.permit(:pooja_id, :order_id, :user_id, :bid_status)#:bid_placed_at_datetime
  end

  def getOrders
    @orders=Order.where(Book_status: 'a').all.paginate(page: params[:page], per_page: 10)
  end

  def index
    if Role.verify(current_user,'pandit')
      render "show"
    else
      flash[:error]="You are not authorized to access this page"
      redirect_to root_path
    end
  end

  def show
    if Role.verify(current_user,'pandit')
      @orders=getOrders.paginate(page: params[:page], per_page: 10)#Orders.all
      @place_bid=PlaceBid.new
    else
      flash[:error]="You are not authorized to access this page!!!"
      redirect_to root_path
    end
  end

  def place_bid
    #algorithm call for assigning pandit
    if Role.verify(current_user,'pandit')
      @place_bid=PlaceBid.new #create(allowed_params_bid)
      @place_bid.user_id = params[:pandit_id]
      @place_bid.order_id = params[:order_id]
      @place_bid.bid_status = 'a'
      @place_bid.placed_at_datetime=Time.now

      if params[:order_id] && params[:pandit_id]
        if @place_bid.save
          flash[:notice] = "Successfully created..."
        end
      else
          flash[:error]="Something went wrong please try again!!!"
      end
    else
      flash[:error]="You are not authorized to access this page!!!"
      redirect_to root_path
    end
  end

  def show_bids
    @bids=PlaceBid.where(user_id:current_user.id)
  end
end
