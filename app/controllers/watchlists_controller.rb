class WatchlistsController < ApplicationController
  before_filter :require_login
  def create 
    @watched = User.find(params[:watchlist][:watched_id])
    current_user.watch!(@watched)
    redirect_to watchlist_path
  end

  def destroy 
    
  end

  def show 
    
  end
end
