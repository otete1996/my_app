class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:destroy]
  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to(article_path(@post.article),notice: '投稿に成功しました')
    else
      render(article_path(@post.article))
    end
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to(article_path(@post.article),notice: "削除しました")
  end

  private
  def post_params
    params.require(:post).permit(:content,:user_id,:article_id)
  end

  def correct_user
    @post=Post.find(params[:id])
    if current_user.id==@post.user_id
    else
      redirect_to(articles_path,notice:"権限がありません")
    end
  end

end
