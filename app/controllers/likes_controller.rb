class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      redirect_to user_tweets_path(params[:user_id])
    end
  end

  def delete
    like = Like.where(like_params)
    if like.destroy_all
      redirect_to user_tweets_path(params[:user_id])
    end
  end

  def like_params
    params.permit(:user_id, :tweet_id)
  end
end
