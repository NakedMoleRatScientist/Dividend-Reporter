class Stock < ActiveRecord::Base
  validates :symbol, :presence => true, :length => { :maximum => 5}
  validates_presence_of :company_name
  has_many :quotes, :dependent => :destroy
  has_many :watchlists, :foreign_key => "stock_id"
  before_save :symbol_upper
  def symbol_upper 
    symbol.upcase!
  end

end
