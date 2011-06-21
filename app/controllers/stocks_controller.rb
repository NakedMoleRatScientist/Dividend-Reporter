class StocksController < ApplicationController
  before_filter :require_login, :except => [:index]
  before_filter :admin_user, :except => [:show,:index]

  def convert_to_quotes symbols
    symbols = symbols.split(", ")
    quotes = YahooStock::Quote.new(:stock_symbols => symbols)
    quotes.standard
    quotes = quotes.results(:to_hash).output
  end

  def become_stocks quotes
    stocks = []
    quotes.each do |q|
      stocks << { :company_name => q[:name], :symbol => q[:symbol] }
    end
    stocks
  end

  def index
    @stocks = Stock.all
  end

  def new 
    
  end

  def create
    stocks = become_stocks(convert_to_quotes(params[:stocks]))
    @success = []
    @fail = []
    stocks.each do |s|
      stock = Stock.new(s)
      if stock.save
        @success << s[:symbol]
      else
        @fail << s[:symbol]
      end
    end
    redirect_to(stocks_path)
  end
  def show 
   @stock = Stock.find(params[:id])
  end

  def destroy 
    
  end
end
