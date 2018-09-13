class PlaceBidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids=PlaceBid.bids_by_user(current_user).paginate(page: params[:page], per_page: 10) #.where(user_id:current_user.id)
  end

  def destroy
    bid =PlaceBid.find params[:id]
    if bid
      bid.bid_status='d'
      bid.save
      redirect_to place_bids_path
    else
      puts "not found"
    end
  end
end
