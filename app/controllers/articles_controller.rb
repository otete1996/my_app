class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @post=Post.new
    @user=current_user
    @posts=Post.all


  end
end
