require "spec_helper"

describe Watchlist do
  before(:each) do
    @watching = Factory(:user)
    @watched = Factory(:stock)

    @watchlist = @watching.watchlists.build(:stock_id => @watched.id)
  end

  it "should create a new instance given valid attributes" do
    watch = @watchlist.save
    watch.should be_valid
  end
end
