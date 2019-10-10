require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  get_tonwhall_email = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  puts get_tonwhall_email.class #le site est bien connecté, je récupère les infos

  get_tonwhall_email.xpath('//section[2]/div/table/tbody/tr[4]/td[2]/text()').each do |townhall_email|
  puts townhall_email.text
  end
end

def get_townhall_urls
   get_townhall_urls = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    puts get_townhall_urls.class
   page = get_townhall_urls.xpath('//*[@class="lientxt"]/@href')
   puts page
end


def perform
  get_townhall_urls
  get_townhall_email ("")
end

perform
