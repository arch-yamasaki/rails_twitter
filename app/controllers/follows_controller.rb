class FollowsController < ApplicationController

  def create
    follow = Follow.new(follow_params)
    if follow.save
      redirect_to session[:referer_path]
    end
  end

  def delete
    follow = Follow.where(follow_params)
    if follow.destroy_all
      redirect_to session[:referer_path]
    end
  end

  private
    def follow_params
      params.permit(:following_id, :followed_id)
    end
end
