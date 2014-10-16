class Dessert
  attr_reader :name, :calories
  def initialize(name, calories)
    @calories = calories
    @name = name
  end

  def healthy?
    @calories < 200 ? true : false
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_reader :flavor
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    flavor == "black licorice" ? false : true
  end
end

# jelly = JellyBean.new("jelly", 300, "fraise")
# p jelly
# p jelly.delicious?