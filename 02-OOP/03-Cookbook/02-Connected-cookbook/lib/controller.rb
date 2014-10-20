require_relative "display"
require_relative "cookbook"
require_relative "recipe"
require_relative "parsing"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @display = Display.new
  end

  def list
    @display.recipes(@cookbook)
  end

  def create
    @cookbook.add_recipe(@display.add_recipes)
  end

  def destroy
    index = @display.remove_recipe(@cookbook)
    @cookbook.remove_recipe(index)
  end

  def parse
    parse = Parsing.new(@display.web_import)
    parse.retrieve.each do |parsed_recipe|
      recipe = Recipe.new(parsed_recipe[:name],parsed_recipe[:description])
      @cookbook.add_recipe(recipe)
    end
  end
end