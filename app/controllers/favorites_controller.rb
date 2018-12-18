class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    board = Board.find(params[:board_id])
    current_user.like(board)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    board = Board.find(params[:board_id])
    current_user.unlike(board)
    redirect_back(fallback_location: root_path)
  end
end
