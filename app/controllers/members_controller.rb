class MembersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id])
  end
end
