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
    @attraction = Attraction.new(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    if @attraction.save
      redirect_to attraction_path @attraction
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end
  
  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    #@ride.take_ride
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

  def attraction_params(*args)
    params.require(:attraction).permit(*args)
  end
end