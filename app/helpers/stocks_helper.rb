module StocksHelper
  def convert_to_quotes stocks
    quotes = YahooStock::Quote.new(:stock_symbols => stock)
    quotes.standard
    quotes = quotes.result(:to_hash).output
  end
end
