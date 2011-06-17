require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    before(:each) do
      @user = Factory(:user)
    end
    it "should be successful" do
      get 'destroy', :id => @user
      response.should redirect_to(root_path)
    end
  end

end
