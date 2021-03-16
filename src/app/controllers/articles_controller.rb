class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
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
    article.delete

    flash[:notice] = "「#{article.title}」の記事を削除しました"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:name, :title, :body).merge(user_id: current_user.id)
  end
end