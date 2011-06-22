module QuotesAndStocks
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
end

