class Articles2Controller < ApplicationController
  before_action :authenticate_user!
  def show
    @article = Article2.find(params[:id])
    @post=Post2.new
    @user=current_user
    @posts=Post2.all

  end
end
