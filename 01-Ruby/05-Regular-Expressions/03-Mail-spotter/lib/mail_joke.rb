# Encoding: utf-8

def mail_joke(email)
<<<<<<< HEAD
  # TODO: Return a joke suited to the email provided

  if email =~ /^(\S+)@(\S+)$/
    mail_info = email.match(/^(\S+)@(\S+)$/)
    if mail_info[2] == "lewagon.org"
      joke = "Well done #{mail_info[1].gsub(/\./," ")}, you're skilled and capable"
    elsif mail_info[2] == "gmail.com"
      joke = "#{mail_info[1].gsub(/\./," ")}, you're an average but modern person"
    elsif mail_info[2] == "live.com"
      joke = "#{mail_info[1].gsub(/\./," ")}, aren't you born before 1973?"
    else
      joke = "Sorry #{mail_info[1].gsub(/\./," ")}, we don't know how to judge '#{mail_info[2]}'"
    end
    return joke
  else
    raise ArgumentError
  end
=======
  # TODO: Return (not print!) a joke suited to the email provided
>>>>>>> fca60cd46159bd8a7de660d46cbce82b2fc4b807
end