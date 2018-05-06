class HomeController < ApplicationController

  def top
      @texts=Article.order('id DESC').page(params[:page]).per(20)
      @topics=Article2.order('id DESC').page(params[:page]).per(20)
  end

  def main

  end
end
