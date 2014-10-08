#Correction de l'exercice 2
def divide(x,y)
x.to_f / y
end

puts divide(5,3)

def shuffle_sample(array, sample_size)
  array.shuffle.take(sample_size)
end

puts shuffle_sample((1..20).to_a, 3)