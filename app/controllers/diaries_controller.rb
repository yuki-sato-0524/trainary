class DiariesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:edit, :update, :destroy]
  
  def index
    @q = current_user.diaries.ransack(params[:q])
    @diaries = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(3)
  end
  
  def analysis
  end
  
  def new
    @diary = current_user.diaries.build
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    
    if @diary.save
      flash[:success] = "成功しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = "失敗しました"
      render "toppages/index"
    end
  end

  
  def edit
    @diary = current_user.diaries.find_by(id: params[:id])
  end
  
  def update
    @diary = current_user.diaries.find_by(id: params[:id])
    
    if @diary.update(diary_params)
      flash[:success] = "更新されました"
      redirect_to root_path
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @diary.destroy
    flash[:success] = "削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:month, :date, :content, :weight, :protein)
  end
  
  def correct_user
    @diary = current_user.diaries.find_by(id: params[:id])
    
    unless @diary
      redirect_to root_url
    end
    
  end
end
