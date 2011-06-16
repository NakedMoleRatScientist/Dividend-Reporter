class Stock < ActiveRecord::Base
  validates :symbol, :presence => true, :length => { :maximum => 5}
  before_save :symbol_upper
  def symbol_upper 
    self.symbol.upcase!
  end
end
