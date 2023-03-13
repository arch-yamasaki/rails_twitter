class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      redirect_to session[:referer_path]
    end
  end

  def delete
    like = Like.where(like_params)
    if like.destroy_all
      redirect_to session[:referer_path]
    end
  end

  def like_params
    params.permit(:user_id, :tweet_id)
  end
end
