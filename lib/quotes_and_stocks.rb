module QuotesAndStocks
  def convert_to_quotes symbols, option = 0
    symbols = symbols.split(", ")
    quotes = YahooStock::Quote.new(:stock_symbols => symbols)
    if option == 0
      quotes.standard
    else
      quotes.extended
    end
    quotes = quotes.results(:to_hash).output
  end

  def standard_quote symbol
    convert_to_quotes(symbol)[0]
  end

  def extended_quote symbol
    convert_to_quotes(symbol, 1)[0]
  end

  def become_stocks quotes
    stocks = []
    quotes.each do |q|
      stocks << { :company_name => q[:name], :symbol => q[:symbol] }
    end
    stocks
  end
end

