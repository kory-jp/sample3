class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    @article = Article.find(params[:article_id])
    @article.create_notification_favorite!(@current_user)
    redirect_to mypage_path
  end

  def destroy
    favorite = Favorite.find_by(article_id: params[:article_id], user_id: current_user.id)
    favorite.destroy
    redirect_to mypage_path
  end
end
