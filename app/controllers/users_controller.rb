class UsersController < ApplicationController
  def new 
    @user = User.new()
  end

  def admin
    @stocks = Stock.all
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Registration successful"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def show 
    
  end

  def index 
    
  end
end
