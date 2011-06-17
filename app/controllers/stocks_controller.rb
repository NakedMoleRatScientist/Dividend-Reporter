class StocksController < ApplicationController
  before_filter :require_login, :except => [:index]
  def index 
    
  end

  def new 
    
  end

  def show 
   @stock = Stock.find(params[:id])
  end
end
