require "spec_helper"

describe WatchlistsController do
  describe "access control" do
    it "should require login for create" do
      post :create
      response.should redirect_to root_path
    end

    it "should require login for destroy" do
      delete :destroy, :id => 1
      response.should redirect_to root_path
    end
  end

  
end
