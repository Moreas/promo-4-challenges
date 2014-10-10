# Encoding: utf-8

def louchebemize(sentence)
  # TODO: implement your louchebem translator

vowel = ['a','e','i','o','u','y']

  if sentence.size > 1
    if is_vowel?(sentence[0])
      sentence.insert(0,'l')
    else
      sentence.split("").each_with_index do |l,i|
        if (!is_vowel?(l))
          sentence.delete_at(i)
        end
          sentence.insert(0,'l')
      end
    end
  end
  return sentence
end


public def is_vowel?(letter)
vowel = ['a','e','i','o','u','y']
return vowel.include?(letter)
end

puts ("Say a word")
sentence = gets.chomp
puts louchebemize(sentence)
# if is_vowel?(sentence[0])
#   puts "voyelle"
# else
#   puts "consonne"
# end