class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @article = @comment.article
      @article.create_notification_comment!(current_user, @comment_id)
      flash[:notice] = 'コメントを投稿しました'
      redirect_to @comment.article
    else
      flash[:comment] = @comment
      flash[:error_messages] = @comment.errors.full_messages
      redirect_back fallback_location: @comment.article
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.article, flash: {notice: 'コメントが削除されました'}
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :comment).merge(user_id: @current_user.id, name:@current_user.name)
  end
end
