require "spec_helper"

describe Watchlist do
  before(:each) do
    @watching = Factory(:user)
    @watched = Factory(:stock)

    @watchlist = @watching.watchlist.build(:stock_id => @watched.id)
  end
end
