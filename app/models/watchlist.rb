class Watchlist < ActiveRecord::Base
  attr_accessible :watched_id, :watching_id
  belongs_to :watching, :class_name => "User"
  belongs_to :watched, :class_name => "Stock"
  validates :watched_id, :presence => true
  validates :watching_id, :presence => true
end
