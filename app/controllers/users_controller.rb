class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      
      redirect_to root_path
    else
      flash[:danger] = "ユーザー登録ができませんでした"
      render "toppages/index"
    end
    
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "ユーザー情報の更新ができませんでした"
      redirect_to edit_user_path(@user)
    end
  end
  
  def edit_pass
    @user = current_user
  end
  
  def update_pass
    @user = current_user
    
    if @user.update(user_password_params)
      flash[:success] = "パスワードを更新しました"
      
      redirect_to user_path(@user)
    else
      flash[:danger] = "パスワードの更新ができませんでした"
      redirect_to edit_pass_path(@user)
    end
    
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    flash[:success] = "--Good Bye--"
    redirect_to root_path
  end

  def show
    @user = current_user
    @goal = @user.goals.last
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
