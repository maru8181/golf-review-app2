class MembersController < ApplicationController
  before_action :sign_in_required, only: %i[show following followers]

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id]).paginate(page: params[:page])
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.all.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.all.paginate(page: params[:page])
    render 'show_follow'
  end
end
