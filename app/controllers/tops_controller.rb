class TopsController < ApplicationController
  def index; end

  def not_login_user
    @tweets = Tweet.paginate(page: params[:page])
  end
end
