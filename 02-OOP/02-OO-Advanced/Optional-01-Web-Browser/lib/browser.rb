require 'open-uri'
require 'nokogiri'

class Browser
  # TODO: add relevant accessors if necessary
  def fetch_content(url)
    content = Nokogiri::HTML(open(url))
    return content.content
  end
end

test = Browser.new
p test.fetch_content("https://transferwise.com/")