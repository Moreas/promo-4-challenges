# Encoding: utf-8
require "csv"
require_relative "controller"
require_relative "recipe"

class Cookbook
  attr_reader :recipes
  def initialize(csv_file)
    @file = csv_file
    @recipes = []
    #csv_options = { col_sep: ',', encoding: "utf-8" }
    CSV.foreach(csv_file) do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    CSV.open(@file, "wb") do |row|
      @recipes.each do |recipe|
        # p "debut test add_recipe"
        # p recipe
        # p recipes.class
        # p recipe.class
        # p recipe.name
        # p "fin test add_recipe"
        row << [recipe.name, recipe.description]
      end
    end
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    CSV.open(@file, "wb") do |row|
      @recipes.each do |recipe|
        row << recipe[name] #{recipe.description}"
      end
    end
  end

  def recipes
    return @recipes
  end
end