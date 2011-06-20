class Stock < ActiveRecord::Base
  validates :symbol, :presence => true, :length => { :maximum => 5}
  validates_presence_of :company_name
end
