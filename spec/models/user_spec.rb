require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :username => "blah",
      :email => "blah@blah.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  it "should create a user with valid attributes" do
    User.create!(@attr)
  end
end
