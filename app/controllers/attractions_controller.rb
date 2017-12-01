class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(name: params[attraction][:name])
    raise @attraction.inspect
  end
  
  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    #@ride.take_ride
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end
end