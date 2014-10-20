require_relative 'cookbook'
require_relative 'recipe'

class Display
  def recipes(cookbook)
    cookbook.recipes.each_with_index do |recipe, index|
      puts("################## Recette #{index} ##################")
      puts "Nom de la recette:            #{recipe.name} \nDescription de la recette:    #{recipe.description}"
    end
  end

  def add_recipes
    puts "Entrez le nom de la recette"
    name = gets.chomp
    puts "Entrez la description de la recette"
    description = gets.chomp
    return Recipe.new(name, description)
  end

  def remove_recipe(cookbook)
    cookbook.recipes.each_with_index do |recipe, index|
      puts "#{index} Nom:#{recipe.name} Description:#{recipe.description}"
    end
    puts "Entrez le no de la recette à supprimer"
    puts ""
    index = gets.chomp.to_i
    return index
  end

  def web_import
    puts "Entrez ce que vous voulez chercher"
    search = gets.chomp
    return search
  end
end