module StocksHelper
  def convert_to_quotes symbols
    stocks = stocks.split(", ")
    stocks.each do |s|
      quotes = YahooStock::Quote.new(:stock_symbols => s)
    end
    quotes.standard
    quotes = quotes.result(:to_hash).output
  end
  def become_stocks quotes
    stocks = []
    quotes.each do |q|
      stocks << { :company_name => q[:name], :symbol => q[:symbol] }
      puts(stocks[-1])
    end
    stocks
  end
end
