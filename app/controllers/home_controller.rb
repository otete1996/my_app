class HomeController < ApplicationController

  def top
      @texts=Article.page(params[:page]).per(20)
      @topics=Article2.page(params[:page]).per(20)
  end
  def main

  end
end
