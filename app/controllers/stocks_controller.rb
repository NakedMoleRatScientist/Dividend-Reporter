class StocksController < ApplicationController
  before_filter :require_login, :except => [:index]
  before_filter :admin_user, :except => [:show,:index]
  def index 
    
  end

  def new 
    
  end

  def show 
   @stock = Stock.find(params[:id])
  end
end
