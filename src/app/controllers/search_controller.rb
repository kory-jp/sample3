class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    keywords = @value.split(/[[:blank:]]+/)
    if @model == 'user'
      @users = User.none
      keywords.each do |keyword|
        @users = @users.or(User.where("name LIKE ?", "%#{keyword}%").or(User.where("introduction LIKE ?", "%#{keyword}%")))
      end
    elsif @model == 'article'
      @articles = Article.none
      keywords.each do |keyword|
        @articles = @articles.or(Article.where("title LIKE ?", "%#{keyword}%").or(Article.where("body LIKE ?", "%#{keyword}%")))
      end
    end
  end
end