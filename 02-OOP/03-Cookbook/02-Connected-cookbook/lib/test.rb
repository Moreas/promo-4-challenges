require 'nokogiri'
require 'open-uri'

response = open("https://transferwise.com/")

doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
 # doc.search('.b-calculator__details results js-b-calculator-details').each do |element|
 #  puts "Rate Info: #{element.search('.b-calculator__details-transferwise')}"
 #  end
 p doc.css('.b-calculator__details-transferwise > p').inner_text.split(" ")