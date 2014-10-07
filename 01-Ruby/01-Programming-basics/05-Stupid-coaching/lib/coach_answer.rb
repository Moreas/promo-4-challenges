def coach_answer(your_message)
  if (your_message.split('').last == "?")
    return ("Silly question, get dressed and go to work!")
  elsif (your_message.upcase == "I AM GOING TO WORK RIGHT NOW!")
    return ("")
  else
    return ("I don't care, get dressed and go to work!")
  end


  # TODO: return coach answer to your_message
end

def coach_answer_enhanced(your_message)

  answer = ""

  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if (your_message.upcase == "I AM GOING TO WORK RIGHT NOW!")
    return ("")
  elsif (your_message.upcase == your_message)
    answer += "I can feel your motivation! "
  end

  if (your_message.split('').last == "?")
   answer += "Silly question, get dressed and go to work!"
  else
    answer += "I don't care, get dressed and go to work!"
  end

return answer

end

