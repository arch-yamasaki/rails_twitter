class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :set_session

  # signinした際のリダイレクトするpathを指定。
  def after_sign_in_path_for(resource)
    tweets_path
  end

  def set_session
    session[:referer_path] = request.fullpath # クエリ付きURLのページにもどるためのpathを保存
  end

  private
  # Punditのエラー処理
  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to session[:referer_path], alert: "権限がなかったので、操作を完了できませんでした"
  end
end
