class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:email, :name, :password, :happiness, :nausea, :height, :tickets, :admin))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def show
    if session[:user_id]
      #raise User.find(params[:id]).inspect
      @user = User.find_by(params[:id])
      raise user_path.inspect
      redirect_to user_path @user
      #puts @user.admin
    else
      redirect_to root_path
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
