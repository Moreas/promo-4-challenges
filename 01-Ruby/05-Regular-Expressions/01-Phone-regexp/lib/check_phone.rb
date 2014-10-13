def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number = phone_number.gsub(/( |-)/, "")
  if phone_number =~ /^(0|\+33)[^0]\d{8}$/
    true
  else
    false
  end
end
