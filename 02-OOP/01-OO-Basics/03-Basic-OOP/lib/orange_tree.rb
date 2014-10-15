class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :fruits
  attr_reader :age, :height, :dead

  def initialize
    @age = 0
    @height = 0
    @dead = false
    @fruits = 0
  end

  def dead?
    if @age <= 50
      return false
    elsif @age < 100
      return (@age < (rand(50) + 50))
    else
      return true
    end
  end

  def one_year_passes!
    @age = @age + 1
    @height = (@age < 10 ? @age : 10)
    @fruits = nb_fruits(@age)
  end

  def pick_a_fruit!
    @fruits -= 1
  end

  def nb_fruits(age)
    if age <= 15 && age > 5
      if age > 5 && age <= 10
        return 100
      else
        return 200
      end
    else
      return 0
    end
  end
end
