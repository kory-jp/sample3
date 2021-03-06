class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_by(mail: params[:session][:mail])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
