require 'spec_helper'

describe StocksController do
  render_views
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    describe "adding stocks" do
      describe "for non-logged in user" do
        it "should deny entry to the new page" do
          get 'new'
          response.should redirect_to(root_url)
        end
      end

    end

  end

end
