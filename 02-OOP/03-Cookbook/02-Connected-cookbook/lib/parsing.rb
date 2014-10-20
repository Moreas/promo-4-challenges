require 'nokogiri'
require 'open-uri'
require_relative 'cookbook'
require_relative 'recipe'

class Parsing

  def initialize(keyword)
    @search = keyword
  end

  def retrieve
    recipes = []
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{@search}")
    doc = Nokogiri::HTML(File.open(response), nil, 'utf-8')
    p doc.search('.m_contenu_resultat').size
    doc.search('.m_contenu_resultat').each do |element|
      name = "#{element.search('.m_titre_resultat > a').inner_text}"
      description = "#{element.search('.m_texte_resultat').inner_text}"
      recipe = {name: name, description: description}
      recipes << recipe
    end
          return recipes
  end

end