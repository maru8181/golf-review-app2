class TopsController < ApplicationController
  def index; end

  def not_login
    @tweets = Tweet.paginate(page: params[:page], per_page: 10)
  end

  def show
    @golf = Golf.find(params[:id])
    @tweets = Tweet.where(golf_id: @golf.id).paginate(page: params[:page], per_page: 10)
  end
end
