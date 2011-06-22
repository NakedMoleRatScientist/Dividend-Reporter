class QuotesController < ApplicationController
  before_filter :require_login
  before_filter :admin_user
  def create 
    redirect_to stocks_path
  end
end
