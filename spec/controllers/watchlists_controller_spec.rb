require "spec_helper"

describe WatchlistsController do
  describe "access control" do
    it "should require login for create" do
      post :create
      response.should redirect_to rooth_path
    end  
  end

  
end
