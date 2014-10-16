class Animal
  def name(name)
    @name = name
    return self
    # TODO: find good instruction
  end

  def specie(specie)
    @specie = specie
    return self
    # TODO: find good instruction
  end

  def color(color)
    @color = color
    return self
    # TODO: find good instruction
  end

  def natural_habitat(natural_habitat)
    @natural_habitat = natural_habitat
    return self
    # TODO: find good instruction
  end

  def to_s
    "Name: #{@name}, Specie: #{@specie}, Color: #{@color}, Natural Habitat: #{@natural_habitat}"
  end
end
