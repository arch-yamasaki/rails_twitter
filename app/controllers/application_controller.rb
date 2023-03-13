class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_session

  def set_session
    session[:referer_path] = request.fullpath # クエリ付きURLのページにもどるためのpathを保存
  end
end
