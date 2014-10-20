require_relative 'cookbook'
require_relative 'recipe'

class Display
  def recipes(cookbook)
    cookbook.recipes.each do |recipe|
      puts "Nom:#{recipe.name} Description:#{recipe.description}"
    end
  end

  def add_recipes(cookbook)
    puts "Entrez le nom de la recette"
    name = gets.chomp
    puts "Entrez la description de la recette"
    description = gets.chomp
    return Recipe.new(name, description)
  end
end