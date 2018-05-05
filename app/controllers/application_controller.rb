class ApplicationController < ActionController::Base
  require 'date'
  require 'open-uri'
  require 'nokogiri'
  protect_from_forgery with: :exception
  before_action :set_up
  before_action :set_up2
  private

  def set_up
    # require 'date'
    # require 'open-uri'
    # require 'nokogiri'
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
  def set_up2
    # require 'date'
    # require 'open-uri'
    # require 'nokogiri'
    day = Date.today
    topic=Article.last
    if topic.blank? || topic.date!=day
      url = 'https://mainichi.jp/flash/1'
      # ccccc('https://mainichi.jp/flash/1', ".midashi"))

      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      @title=Array.new(20)
      page = Nokogiri::HTML.parse(html, nil, charset)

      20.times do |index|
        shuzo_meigen = page.css(".midashi")[index]
        @title[index]=shuzo_meigen.text
      end

      20.times do |index|
        @post2=Article2.new(content: @title[index],date: day)
        @post2.save
      end
    end
  end
  # def ccccc(url, css_test)
  #   charset = nil
  #   html = open(url) do |f|
  #     charset = f.charset
  #     f.read
  #   end
  #
  #   @title=Array.new(20)
  #   page = Nokogiri::HTML.parse(html, nil, charset)
  #
  #   20.times do |index|
  #     shuzo_meigen = page.css(css_test)[index]
  #     @title[index]=shuzo_meigen.text
  #   end
  #
  #   20.times do |index|
  #     @post2=Article2.new(content: @title[index],date: day)
  #     @post2.save
  #   end
  # end
end
