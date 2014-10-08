 def wagon_sort(students)
  # TODO: return (not print!) a copy of students, sorted alphabetically
  students.sort_by!{|x| x.downcase}
end