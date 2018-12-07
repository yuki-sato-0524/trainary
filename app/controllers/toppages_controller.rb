class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @diary_last = @user.diaries.last
      @diary = @user.diaries.build
      @goal = @user.goals.last
    else
      @user = User.new
    end
  end
end
