require_relative "compute_name"

# TODO: ask for the first name
# TODO: ask for the middle name
# TODO: ask for the last name
# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"

puts "What's your first name?"
fname = gets.chomp

puts "What's your middle name?"
mname = gets.chomp

puts "What's your last name?"
lname = gets.chomp

puts "Hello #{compute_name(fname,mname,lname)}"




