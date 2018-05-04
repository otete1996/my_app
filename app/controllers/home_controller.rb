class HomeController < ApplicationController

  def top
    require 'open-uri'
require 'nokogiri'

url = 'https://news.yahoo.co.jp/list/?d=20180504&mc=f&mp=f'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

page = Nokogiri::HTML.parse(html, nil, charset)

shuzo_meigen = page.css("dt")[0]

  @txt=shuzo_meigen.text

  end
end
