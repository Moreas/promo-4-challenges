def mail_joke(email)
  (email =~ /^(\S+)@(\S+)$/) ?  (mail_info = email.match(/^(\S+)@(\S+)$/)) : (fail ArgumentError)
  if mail_info[2] == "lewagon.org"
    return "Well done #{mail_info[1].gsub(/\./, " ")}, you're skilled and capable"
  elsif mail_info[2] == "gmail.com"
    return "#{mail_info[1].gsub(/\./, " ")}, you're an average but modern person"
  elsif mail_info[2] == "live.com"
    return "#{mail_info[1].gsub(/\./, " ")}, aren't you born before 1973?"
  else
    return "Sorry #{mail_info[1].gsub(/\./, " ")}, we don't know how to judge '#{mail_info[2]}'"
  end
end