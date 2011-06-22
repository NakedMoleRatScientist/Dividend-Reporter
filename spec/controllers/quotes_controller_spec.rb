require "spec_helper"

describe QuotesController do
  render_views
  describe "GET 'new'" do
    describe "for non-logged in user" do
      it "should deny entry to the new page" do
        get 'new'
        response.should redirect_to(root_url)
      end
    end

  end

end

