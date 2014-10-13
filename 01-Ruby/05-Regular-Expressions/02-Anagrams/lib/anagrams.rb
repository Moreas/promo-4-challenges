def anagrams?(a_string, another_string)
  # TODO: implement the obvious method to test if two words are anagrams
  a_string  = a_string.gsub(/\W/, "")
  another_string = another_string.gsub(/\W/, "")
  (a_string.upcase.split("").sort.join == another_string.upcase.split("").sort.join) ? (return true) : (return false)
end

def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
  a_string  = a_string.gsub(/\W/, "")
  another_string = another_string.gsub(/\W/, "")
  w1 = Hash.new(0)
  w2 = Hash.new(0)
  a_string.split("").each { |l| w1[a_string[l].downcase] = w1[a_string[l].downcase] + 1 }
  another_string.split("").each { |l| w2[another_string[l].downcase] = w2[another_string[l].downcase] + 1 }
  (w1.eql?(w2)) ? (anagram = true) : (anagram = false)
  return ((a_string.size == another_string.size) & anagram)
end


