class Watchlist < ActiveRecord::Base
  attr_accessible :watched_id, :watching_id
end
