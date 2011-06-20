class Stock < ActiveRecord::Base
  validates :symbol, :presence => true, :length => { :maximum => 5}
end
