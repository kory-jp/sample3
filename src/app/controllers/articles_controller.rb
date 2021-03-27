class ArticlesController < ApplicationController
  skip_before_action :authenticate_user, {only: [:index, :show]}

  def index
    # @articles = Article.page(params[:page])
    # @users = User.where(id: @articles.pluck(:user_id))
    @articles = Article.userName.page(params[:page]).order(id: "DESC")
  end

  def new
    @article = Article.new(flash[:article])
  end  

  def create
    article = Article.new(article_params)
    if article.save
      flash[:notice] = "「#{article.title}」の記事を作成しました"
      redirect_to article
    else 
      redirect_to new_article_path, flash: {
        article: article,
        error_messages: article.errors.full_messages
      }
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find_by(id: @article.user_id)
    @comment = Comment.new(article_id: @article.id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    if article.save
      flash[:notice] = "「#{article.title}」の記事を編集しました"
      redirect_to article
    else
      redirect_to edit_article_path, flash: {
        article: article,
        error_messages: article.errors.full_messages
      }
    end

    # redirect_to article
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    flash[:notice] = "「#{article.title}」の記事を削除しました"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image).merge(user_id: current_user.id)
  end
end