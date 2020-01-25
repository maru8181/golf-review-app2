class TopsController < ApplicationController
  def index; end

  def not_login
    @tweets = Tweet.paginate(page: params[:page])
  end
end
