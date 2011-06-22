require "spec_helper"

describe QuotesController do
  render_views
  describe "POST 'create'" do
    describe "for non-logged in user" do
      it "should deny entry to the new page" do
        post :create, :quote => @attr
        response.should redirect_to(root_url)
      end
    end

  end

end

