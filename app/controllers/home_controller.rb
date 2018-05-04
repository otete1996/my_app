class HomeController < ApplicationController

  def top
 @texts=Article.all
  end
end
