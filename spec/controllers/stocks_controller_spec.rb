require 'spec_helper'

describe StocksController do
  render_views
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    describe "for non-logged in user" do
      it "should not show stocks" do
        get 'show'
        response.should_not be_success
      end
       
    end

    describe "for logged in user" do
      it "should show stocks" do
        get 'show'
        response.should be_success
      end
    end


  end      
  describe "GET 'new'" do
    describe "adding stocks" do
      describe "for non-logged in user" do
        it "should deny entry to the new page" do
          get 'new'
          response.should redirect_to(root_url)
        end
      end

      describe "for logged in user" do
        before(:each) do
          test_sign_in(Factory(:user))
        end

       
        it "should deny entry to the new page for those that are not adminstrator" do
          get 'new'
          response.should redirect_to(root_url)
          flash[:notice].should =~ /no admin access/
        end
      end
    end
  end

end
