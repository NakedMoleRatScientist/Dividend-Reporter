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
        :price => BigDecimal.new("#{stand[:last_trade_prize_only]}"),
        :dividend_share => BigDecimal.new("#{extend[:dividend_per_share]}"),
        :yield => BigDecimal.new("#{extend[:dividend_yield]}")
      }
    end  
    redirect_to stocks_path
  end
end
