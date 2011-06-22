require 'spec_helper'

describe StocksController do
  render_views
  describe "GET 'index'" do
    
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    describe "with a sample populated stock index" do
      before(:each) do
        @stock = Factory(:stock)
      end

      it "should have a company name link" do
        get 'index'
        response.should have_selector(:a, :content => "Google Inc.") 
      end
    end

  end

  describe "GET 'show'" do

    before(:each) do
      @stock = Factory(:stock)
    end

    describe "for non-logged in user" do
      it "should not show stocks" do
        get 'show', :id => @stock
        response.should_not be_success
      end
       
    end

    describe "for logged in user" do
      before(:each) do
        login_user(Factory(:user))
      end
      it "should show stocks" do
        get 'show', :id => @stock
        response.should be_success
      end
    end


  end      
  describe "POST 'create'" do
    before(:each) do
      @attr = "GOOG"
    end
    describe "for non-logged in user" do
      it "should deny ability to create" do
        post :create, :stocks => @attr
        response.should redirect_to(root_url)
      end
    end

    describe "for logged in user" do
      before(:each) do
        @user = Factory(:user)
        login_user(@user)
      end

      describe "for non-admin" do
        it "should deny ability to create for those that are not adminstrator" do
          post :create, :stocks => @attr
          response.should redirect_to(root_url)
          flash[:notice].should == "You do not have admin access."
        end  
      end
 
      describe "for admin" do
        before(:each) do
          @user.toggle!(:admin)
        end

        it "should not deny ability to create for those that are adminstrator" do
          post :create, :stocks => @attr
          response.should redirect_to(stocks_url)
        end

        describe "creating stocks" do
          describe "with three valid stocks" do
            before(:each) do
              @attr = "GOOG, KR, YAHOO"  
            end

            it "should create three stocks" do
              lambda do
                post :create, :stocks => @attr
              end.should change(Stock, :count).by(3)
            end
          end
        end
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @stock = Factory(:stock)
    end

    describe "for non-logged-in user" do
      it "should deny access" do
        delete :destroy, :id => @stock
        response.should redirect_to(root_path)
      end
    end

    describe "for logged-in user" do
      before(:each) do
        @user = Factory(:user)
        login_user(@user)
      end
      describe "for non-admin" do
        it "should deny entry to destroy for those that are not adminstrator" do
          delete :destroy, :id => @stock
          response.should redirect_to(root_url)
          flash[:notice].should == "You do not have admin access."
        end
      end

      describe "for admin" do

        before(:each)do
          @user.toggle!(:admin)
        end

        it "should redirect to root path" do
          delete :destroy, :id => @stock
          response.should redirect_to(stocks_url)
        end
        it "should have a successful change in stock count by -1" do
          lambda do
            delete :destroy, :id => @stock
          end.should change(Stock, :count).by(-1)
        end
      end


    end


  end

end
