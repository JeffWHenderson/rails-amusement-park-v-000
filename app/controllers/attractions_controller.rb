class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @user = session[:user_id]
    @attraction = Attraction.find(params[:id])
  end
end