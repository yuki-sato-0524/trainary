class GoalsController < ApplicationController
  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    
    if @goal.save
      flash[:success] = "目標を設定しました"
      redirect_to root_path
    else 
      flash[:danger] = "目標の設定に失敗しました"
      render :new
    end
  end

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    
    if @goal.update(goal_params)
      flash[:success] = "目標を更新しました"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "目標の更新に失敗しました"
      render :edit
    end
  end
  
  private 
  def goal_params
    params.require(:goal).permit(:goal_weight, :goal_protein, :goal_memo, :year, :month, :date)
  end
end
