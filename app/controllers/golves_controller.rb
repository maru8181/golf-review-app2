class GolvesController < ApplicationController
  def index
    @q = Golf.ransack(params[:q])
    @golves = @q.result(distinct: true)
  end

  def show
    @golf = Golf.find(params[:id])
    @tweets = Tweet.where(golf_id: @golf.id)
  end

  def rank
    @golves = Golf.all
  end
end
