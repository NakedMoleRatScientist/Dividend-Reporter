class QuotesController < ApplicationController
  before_filter :require_login
  before_filter :admin_user
  def create
    stocks = Stock.all
    stocks.each do |s|
      stand = standard_quote(s.symbol)
      extend = extended_quote(s.symbol)
      attr = {
        :stock_id => s.id,
      }
    end  
    redirect_to stocks_path
  end
end
