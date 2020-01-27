class GolvesController < ApplicationController
  def index
    @q = Golf.ransack(params[:q])
    @golves = @q.result(distinct: true)
  end

  def show
    @golf = Golf.find(params[:id])
    @tweets = Tweet.where(golf_id: @golf.id).paginate(page: params[:page], per_page: 10)
  end

  def rank
    @golves = Golf.all
  end
end
