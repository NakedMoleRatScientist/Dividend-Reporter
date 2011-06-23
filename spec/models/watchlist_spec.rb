require "spec_helper"

describe Watchlist do
  before(:each) do
    @watching = Factory(:user)
    @watched = Factory(:stock)

    @watchlist = @watching.watchlists.build(:watched_id => @watched.id, :watching_id => @watching.id)
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

    it "should have the right watching" do
      @watchlist.watching.should == @watching
    end

    it "should have a watched attribute" do
      @watchlist.should respond_to(:watched)
    end
  end

  describe "validations" do
    it "should require a watched_id" do
      @watchlist.watched_id = nil
      @watchlist.should_not be_valid
    end

    it "should require a watching_id" do
      @watchlist.watching_id = nil
      @watchlist.should_not be_valid
    end
  end

end
