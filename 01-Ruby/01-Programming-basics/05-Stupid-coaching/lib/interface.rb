require_relative "coach_answer"

puts "What do you want to say to your coach?"
my_answer = gets.chomp

puts coach_answer_enhanced(my_answer)

while (coach_answer_enhanced(my_answer) != "")


puts "What do you want to say to your coach?"
my_answer = gets.chomp


puts coach_answer_enhanced(my_answer)
end



# TODO: Implement the program that makes you discuss with your coach from the terminal.
