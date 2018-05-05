class PostsController < ApplicationController
  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to(article_path(@post.article))
    else
      render(article_path(@post.article))
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to(article_path(@post.article))
  end

  private
  def post_params
    params.require(:post).permit(:content,:user_id,:article_id)
  end

end
