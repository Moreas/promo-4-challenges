require_relative "wagon_sort"

students = []
name = nil
while name != ""
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets.chomp
  students << name if name != ""
end
sorted_students = wagon_sort(students)
puts "Congratulations! Your Wagon has #{ sorted_students.size } students:"
if sorted_students.size >= 2
  puts "#{ sorted_students[0..-2].join(', ') } and #{ sorted_students.last }"
else
  puts sorted_students.first
end