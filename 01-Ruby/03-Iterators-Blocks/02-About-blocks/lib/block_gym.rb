def tag(tag_name, attr = nil)
  # TODO:  Build HTML tags around  content given in the block
  #        The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
"<#{tag_name}#{" #{attr[0]}" if attr != nil}#{ "='#{attr[1]}'" if attr != nil}>#{yield}</#{tag_name}>"end



def timer_for
  # TODO:  Return time taken to execute the given block
  start_time = Time.now
  yield
  Time.now - start_time
end
