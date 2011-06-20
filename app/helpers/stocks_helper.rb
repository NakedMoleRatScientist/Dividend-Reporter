module StocksHelper
  def convert_to_quotes symbols
    stocks.split!(", ")
    quotes = YahooStock::Quote.new(:stock_symbols => stock)
    quotes.standard
    quotes = quotes.result(:to_hash).output
  end
  def become_stocks quotes
    stocks = {}
    quotes.each do |q|
      stocks << { :company_name => q[:name], :symbol => q[:symbol] }
    end
    stocks
  end
end
