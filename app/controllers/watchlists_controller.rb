class WatchlistsController < ApplicationController
  before_filter :require_login
  def create 
    @watched = User.find(params[:watchlist][:watched_id])
    current_user.watch!(@watched)
    redirect_to watchlist_path(current_user.id)
  end

  def destroy 
    @watched = Watchlist.find(params[:id]).watched
    current_user.unwatch!(@watched)
    redirect_to watchlist_path(current_user.id)
  end

  def show 
    @watchlists = User.find_by_id(params[:id]).watchlists
  end
end
