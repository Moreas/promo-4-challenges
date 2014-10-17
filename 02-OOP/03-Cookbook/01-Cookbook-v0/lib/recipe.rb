class Recipe
    attr_reader :name, :description
  def initialize(name, description)
    @name = name
    @description = description
  end

  def pick_recipe(name)
    if name == @name
      return self
    end
  end
end