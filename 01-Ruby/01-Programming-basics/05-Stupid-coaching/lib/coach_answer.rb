def coach_answer(your_message)

  if your_message.end_with?("?")
    return "Silly question, get dressed and go to work!"
  elsif your_message.upcase == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  else
    return "I don't care, get dressed and go to work!"
  end

end

def coach_answer_enhanced(your_message)

  answer = ""

  if your_message.upcase == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  elsif your_message.upcase == your_message
    answer += "I can feel your motivation! "
  end

  answer += coach_answer(your_message)

  return answer
end