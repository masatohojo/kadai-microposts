class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.bookmark(@micropost)
    flash[:success] = 'コメントをブックマークしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unbookmark(@micropost)
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_url)
  end
end
