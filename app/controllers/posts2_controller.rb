class Posts2Controller < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:destroy]
  def create
    @post=Post2.new(post2_params)
    if @post.save
      redirect_to(article2_path(@post.article),notice: '投稿に成功しました')
    else
      @posts=Post2.where(article_id: params[:article2_id].to_i)
      @article=Article2.find(params[:article_id])
      flash[:alert]="項目を入力してください"
      render template: "articles/show"
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to(article2_path(@post.article),notice: "削除しました")
  end

  def edit
  end

  def update
  end
  private
  def post2_params
    params.require(:post2).permit(:content,:user_id,:article_id)
  end
  def correct_user
    @post=Post.find(params[:id])
    if current_user.id==@post.user_id
    else
      redirect_to(articles_path,notice:"権限がありません")
    end
  end

end
