require "spec_helper"

describe QuotesController do
  render_views
  describe "POST 'create'" do
    describe "for non-logged in user" do
      it "should ability to create" do
        post :create
        response.should redirect_to(root_url)
      end
    end

    describe "for logged-in user" do
      before(:each) do
        @user = Factory(:user)
        login_user(@user)
      end

      describe "for non-admin" do
        it "should deny ability to create for those that are not adminstrator" do
          post :create
          response.should redirect_to(root_url)
          flash[:notice].should == "You do not have admin access."
        end
      end

      describe "for admin" do
        before(:each) do
          @user.toggle!(:admin)
          Factory(:stock)
        end

        it "should not deny ability to create for those that are adminstrator" do
          post :create
          response.should redirect_to(stocks_url)
        end
      end


    end


  end

end

