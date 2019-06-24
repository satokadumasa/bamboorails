class UsersController < ApplicationController
  def following
      @user  = User.find(params[:id])
      @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
