class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user
      flash[:success] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "ユーザー登録ができませんでした"
      render :new
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    flash[:success] = "--Good Bye--"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id]) 
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
