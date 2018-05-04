class HomeController < ApplicationController

  def top
 @texts=Article.all
  end
  def main
    
  end
end
