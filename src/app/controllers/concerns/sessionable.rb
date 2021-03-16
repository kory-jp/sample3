module Sessionable
  extend ActiveSupport::Concern

  private
  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to root_path
    end
  end
end