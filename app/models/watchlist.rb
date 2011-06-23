class Watchlist < ActiveRecord::Base
  attr_accessible :stock_id, :user_id
  belongs_to :watching, :class_name => "User"
  belongs_to :watched, :class_name => "Stock"
  validates :stock_id, :presence => true
  validates :user_id, :presence => true
end
