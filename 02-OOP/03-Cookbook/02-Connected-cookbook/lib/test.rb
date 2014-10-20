require 'nokogiri'
require 'open-uri'

puts "Que cherchez-vous?"
search = gets.chomp
response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{search}")

doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
 doc.search('.m_contenu_resultat').each do |element|
  puts "Nom: #{element.search('.m_titre_resultat > a').inner_text}"
  puts "Description: #{element.search('.m_texte_resultat').inner_text}"
  end