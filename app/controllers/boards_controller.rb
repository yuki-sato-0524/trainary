class BoardsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def index
    @boards = Board.all.order('created_at DESC').page(params[:page]).per(3)
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    
    if @board.save
      flash[:success] = "投稿しました"
      redirect_to boards_path
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end

  
  def show
    @board = Board.find_by(id: params[:id])
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    
    @board.destroy
    redirect_back(fallback_location: root_path)
  end
  
  
  
private 
  
  def board_params
    params.require(:board).permit(:content, :title)
  end
  
  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    
    redirect_to root_path unless @board
  end
end
