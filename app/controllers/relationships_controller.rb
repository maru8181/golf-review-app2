class RelationshipsController < ApplicationController
  before_action :sign_in_required

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to member_url(@user) }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to member_url(@user) }
      format.js
    end
  end
end
