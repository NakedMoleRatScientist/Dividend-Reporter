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

  describe "stock association" do
    before(:each) do
      @stock = Factory(:stock)
      @user = @stock.users.create(@attr)
    end

    it "should have a stock attribute" do
      @quote.should respond_to(:stock)
    end
  end

end
