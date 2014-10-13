def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagrams
  debut = Time.now
   a_string  = a_string.gsub(/\W/,"")
   another_string = another_string.gsub(/\W/,"")
  anagram = false
  if a_string.upcase.split("").sort.join == another_string.upcase.split("").sort.join
    anagram = true
  end
  fin = Time.now
  p fin - debut
  return anagram
end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method
  debut = Time.now
  a_string  = a_string.gsub(/\W/,"")
  another_string = another_string.gsub(/\W/,"")
  anagram = false

  i = 0

  w1 = Hash.new(0)
  w2 = Hash.new(0)
  if a_string.size == another_string.size
    while ((i+1) <= a_string.size)
      w1[a_string[i].downcase] = w1[a_string[i].downcase] + 1
      w2[another_string[i].downcase] = w2[another_string[i].downcase] + 1
      i = i+1
    end
    if w1.eql?(w2)
      anagram = true
    end
  end
  fin = Time.now
  p fin - debut
  return anagram
end

p "1ere methode"
p anagrams?("Monica Lewinsky!", "Nice silky woman")

p "2eme methode"
p anagrams_on_steroids?("Monica Lewinsky!", "Nice silky woman")
  # TODO: implement the obvious method to test if two words are anagrams

def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
end
>>>>>>> fca60cd46159bd8a7de660d46cbce82b2fc4b807
