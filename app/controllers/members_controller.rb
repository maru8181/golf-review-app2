class MembersController < ApplicationController
  before_action :sign_in_required, only: %i[show following followers]
  before_action :admin_required, only: %i[index delete]

  def index
    @users = User.paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id]).paginate(page: params[:page], per_page: 10)
  end

  def following
    @title = 'フォローしているユーザー'
    @user  = User.find(params[:id])
    @users = @user.following.all.paginate(page: params[:page], per_page: 30)
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user  = User.find(params[:id])
    @users = @user.followers.all.paginate(page: params[:page], per_page: 30)
    render 'show_follow'
  end

  def destroy
    @user = User.find(params[:id])
    if @user.admin?
      flash[:admin_error] = '管理人は削除できません'
    elsif @user.email == 'guest@example.com'
      flash[:guest_error] = 'ゲストユーザーは削除できません'
    else
      @user.destroy
      flash[:delete_success] = '削除しました'
    end
    redirect_to members_url
  end
end
