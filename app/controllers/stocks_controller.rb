class StocksController < ApplicationController
  before_filter :require_login, :except => [:index]
  before_filter :admin_user, :except => [:show,:index]
  def index 
    
  end

  def new 
    
  end

  def create 
    stocks = params[:stocks]
    stocks = stocks.spilit(", ")
    @success = []
    @fail = []
    stocks.each do |s|
      if s.save
        @success < s
      else
        @fail < s
      end
    end 
  end
  def show 
   @stock = Stock.find(params[:id])
  end
end
