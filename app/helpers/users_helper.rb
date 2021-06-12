require 'nokogiri'
require 'open-uri'

module UsersHelper

  def scrape_site(user, the_url)
    html = URI.open(the_url)
    doc = Nokogiri::HTML(html)

    headings = doc.css('h1', 'h2', 'h3')
    heading_arr = []

    headings.each do |h|
      hedVal = h.text
      heading_arr << hedVal

      user.update headings: heading_arr
    end
  end
end