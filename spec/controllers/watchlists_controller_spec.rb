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
  describe "POST 'create'" do
    before(:each) do
      @user = login_user(Factory(:user))
      @watched = Factory(:stock)
    end

    it "should create a watchlist" do
      lambda do
        post :create, :watchlist => {:watched_id => @watched}
        response.should be_redirect
      end.should change(Watchlist, :count).by(1)
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @user = login_user(Factory(:user))
      @watched = Factory(:stock)
      @user.watch!(@watched)
      @watchlist = @user.watchlists.find_by_watched_id(@watched)
    end

    it "should destroy a watchlist" do
      lambda do
        delete :destroy, :id => @watchlist
        response.should be_redirect
      end.should change(Watchlist, :count).by(-1)
    end
  end


  
end
