class Stock < ActiveRecord::Base
  validates :stock, :presence => true
end
