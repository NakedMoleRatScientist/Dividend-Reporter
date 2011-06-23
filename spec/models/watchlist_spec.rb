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

  describe "watch methods" do
    before(:each) do
      @watchlist.save
    end

    it "should have a watched attribute" do
      @watchlist.should respond_to(:watched)
    end

    it "should have the right watched" do
      @watchlist.watched.should == @watched
    end
  end

  describe "validations" do
    it "should require a stock_id" do
      @watchlist.stock_id = nil
      @watchlist.should_not be_valid
    end

    it "should require a user_id" do
      @watchlist.user_id = nil
      @watchlist.should_not be_valid
    end
  end

end
