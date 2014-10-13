def array_to_hash(array)
  #TODO: implement the method :)
  hash = Hash.new
  array.each_with_index { |item, index|
  hash[block_given? ? yield(index) : index] = item
}
return hash
end