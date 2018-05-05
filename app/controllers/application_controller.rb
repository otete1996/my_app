class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_up
  private

  def set_up
    require 'date'
    require 'open-uri'
    require 'nokogiri'
    day = Date.today
    article=Article.last
    if article.blank? || article.date!=day
      url = 'https://news.yahoo.co.jp/list/?d=20180504&mc=f&mp=f'

      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      @txt=Array.new(20)
      page = Nokogiri::HTML.parse(html, nil, charset)

      20.times do |index|
        shuzo_meigen = page.css("dt")[index]
        @txt[index]=shuzo_meigen.text
      end

      20.times do |index|
        @post=Article.new(content: @txt[index],date: day)
        @post.save
      end
    end
  end
end
