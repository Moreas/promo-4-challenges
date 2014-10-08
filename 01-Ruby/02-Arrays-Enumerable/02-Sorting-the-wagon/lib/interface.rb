require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.1.2/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.1.2/String.html#method-i-chomp


puts "Type a student name:"
list = []
answer = gets.chomp

while !(answer == "")
  list << answer
  puts "Type another student name (or press enter to finish):"
  answer = gets.chomp
end

puts "Congratulations! Your wagon has #{list.size} students:"
print "- "
list = wagon_sort(list)

for i in (0..list.size - 1)
  print list[i].chomp
  if i < list.size - 2
    print ", "
  elsif i == (list.size - 2)
    print ", and "
  end
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
