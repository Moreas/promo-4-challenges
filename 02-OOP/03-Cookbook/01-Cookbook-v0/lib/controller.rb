require_relative "display"
require_relative "cookbook"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @display = Display.new
  end

  def list
    @display.recipes(@cookbook)
  end

  def create
    @cookbook.add_recipe(@display.add_recipes(@cookbook),"recipe.csv")
  end

  def destroy

  end
end