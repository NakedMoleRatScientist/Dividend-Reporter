require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :username => "blah",
      :email => "blah@blah.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :admin => false
    }
  end
  it "should create a user with valid attributes" do
    User.create!(@attr)
  end

  describe "watchlist" do
    before(:each) do
      @user = User.create!(@attr)
      @watched = Factory(:stock)
    end

    it "should have a stock attribute" do
      @user.should respond_to(:watchlists)
    end
  end

end
