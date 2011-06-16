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
end
