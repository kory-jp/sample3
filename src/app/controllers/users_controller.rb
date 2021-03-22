class UsersController < ApplicationController
  skip_before_action :authenticate_user, {only: [:new, :create]}

  def index
    @users = User.all
  end

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_back fallback_location: users_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def me
    @user = current_user
    @favorite_articles = @user.favorite_articles
  end

  def edit
    @user = current_user
  end   

  def updated
    @user = user.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path
    else
      redirect_to edit_user_path, flash: {
        user: @user,
        error_messages: @user.error_messages
      }
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
