class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @diary = @user.diaries.build
      
      @diary_last = @user.diaries.first
      @goal = @user.goals.last
    else
      @user = User.new
    end
  end
end
