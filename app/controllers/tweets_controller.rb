class TweetsController < ApplicationController
  before_action :sign_in_required
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.paginate(page: params[:page], per_page: 10)
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show; end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit; end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to member_url(current_user), notice: '投稿しました' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: '編集しました' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  def follow_tweet
    @users = current_user.following
    @tweets = []
    @users.each do |user|
      @tweets += Tweet.where(user_id: user.id).reverse_order
    end
    @tweets = @tweets.sort_by(&:created_at).reverse
    @tweets = @tweets.paginate(page: params[:page], per_page: 10)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params.require(:tweet).permit(:golf_id, :point_id, :text, :image)
  end
end
