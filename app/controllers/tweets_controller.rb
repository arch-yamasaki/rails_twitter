class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets
  def index
    @tweets = Tweet.page(params[:page])
    @user = User.find(params[:user_id])
    session[:current_query] = request.query_parameters # 現在のページにもどれるようにクエリパラメータを保管する
  end

  # GET /tweets/1
  def show
    @user = User.find(params[:user_id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    @user = User.find(params[:user_id])
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.create(tweet_params)
    @user = User.find(params[:user_id])
    # binding.pry
    if @tweet.save
      # redirect_to @tweet, notice: "Tweet was successfully created."
      redirect_to user_tweet_path(@user, @tweet), notice: "Tweet was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to user_tweet_path(params[:user_id], @tweet), notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to user_tweets_path(params[:user_id]), notice: "Tweet was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(paraams[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:text).merge(user_id: params[:user_id])
    end
end
