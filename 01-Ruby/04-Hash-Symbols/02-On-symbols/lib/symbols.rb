# NOTE: Read about BasicObject#object_id
# http://www.ruby-doc.org/core-2.1.1/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

def are_identical_symbols_same_objects?
  # TODO: true or false?
  true
end

def are_identical_strings_same_objects?
  # TODO: true or false?
  false
end


# Remember, RTFM! Your doc is your friend
# - http://www.ruby-doc.org/core-2.1.1/String.html
# - http://www.ruby-doc.org/core-2.1.1/Symbol.html

def convert_string_to_symbol(a_string)
  # TODO: return the symbol version of "a_string"
  return a_string.to_sym
end

def convert_symbol_to_string(a_symbol)
  # TODO: return the string version of "a_symbol"
  return a_symbol.to_s
end

def me
  # TODO: return a Hash representing yourself, with keys such as age and name
  me = {
  name: "Florent",
  age: 32
}
return me
end

def fruits
  # TODO: return an array of fruits
  fruits = ["pomme", "poire", "pêche"]
end