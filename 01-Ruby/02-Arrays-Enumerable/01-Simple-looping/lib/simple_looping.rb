<<<<<<< HEAD
def sum_with_while(min,max)
  i=min
  sum=0def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself

  until min == max
      sum = min + 1
      min = min + 1
      return sum_recursive(sum, max)
  end

end
  while i <= max
    sum = sum + i
    i = i+1
  end
  return sum
    #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a while..end structure
end

def sum_with_for(min,max)
  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a for..end structure
  sum = 0
  for i in  (min..max)
  sum = sum + i
  end
  return sum
end

def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself

  until min == max
      sum = min + 1
        return sum_recursive(sum, max)
      min = min + 1
  end

=======
def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
end

def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
end

def sum_recursive(min, max)
  # CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
>>>>>>> c7dc7e6a03f18e26e6959fb11e05dc7bed22003b
end

