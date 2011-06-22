require "spec_helper"

describe QuotesController do
  render_views
  describe "POST 'create'" do
    describe "for non-logged in user" do
      it "should ability to create" do
        post :create, :quote => @attr
        response.should redirect_to(root_url)
      end
    end

    describe "for logged-in user" do
      before(:each) do
        @user = Factory(:user)
        login_user(@user)
      end
    end


  end

end

