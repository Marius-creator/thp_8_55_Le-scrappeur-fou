require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
   crypto_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
   puts crypto_page.class #le site est bien connecté, je récupère les infos

  crypto_symbol_array = Array.new #initialiser le tab symbol
  crypto_price_array = Array.new #initialiser le tab price
  crypto_hash = Hash.new #initialiser le hash
  crypto_array_final=Array.new


  crypto_page.xpath('//tr/td[3]/text()').each do |currency_symbol|
     crypto_symbol_array.push (currency_symbol.text) #récupère en format text les symbole de chaque cryptos
  end

  crypto_page.xpath('//tr/td[5]/a/text()').each do |currency_price|
     crypto_price_array.push currency_price.text #récupère en format text les prix de chaque cryptos
  end

  i = 0
  while i < crypto_symbol_array.size
   key_symbol_crypto = crypto_symbol_array[i]
   value_price_crypto = crypto_price_array[i]
   i = i + 1
   crypto_hash = {key_symbol_crypto => value_price_crypto}

   crypto_array_final << crypto_hash
  end
  puts crypto_array_final[0]
end

crypto_scrapper
