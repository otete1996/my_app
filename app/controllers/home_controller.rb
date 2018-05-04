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
@txt=Array.new(20)

page = Nokogiri::HTML.parse(html, nil, charset)
20.times do |index|


shuzo_meigen = page.css("dt")[index]

  @txt[index]=shuzo_meigen.text
end


  end
end
