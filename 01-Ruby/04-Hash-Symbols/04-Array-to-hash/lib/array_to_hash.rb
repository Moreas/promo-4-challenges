def array_to_hash(array)
  #TODO: implement the method :)
hash = Hash.new
  array.each_with_index { |item, index|
  #yield
  hash[index] = item
}
return hash
end
# array_to_hash(key) do
# index = "#{key}#{index}"
# end