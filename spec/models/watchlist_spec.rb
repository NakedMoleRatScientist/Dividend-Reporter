require "spec_helper"

describe Watchlist do
  before(:each) do
    @watching = Factory(:user)
    @watched = Factory(:stock)

    @watchlist = @watching.watchlists.build(:stock_id => @watched.id, :user_id => @watching.id)
  end

  it "should create a new instance given valid attributes" do
    @watchlist.save!
  end

  describe "validations" do
    it "should require a stock_id" do
      @watchlist.stock_id = nil
      @watchlist.should_not be_valid
    end
  end

end
