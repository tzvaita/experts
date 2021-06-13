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

  def short_url(user, url)
    token ='8f1a0d4a1aeb4a109b4ca3c23ad95a9bee0009c8'
    client = Bitly::API::Client.new(token: token)
    bitlink = client.shorten(long_url: url)
    user.update shortened: bitlink.link
  end

  def mutual_friends(user)
    mutual = current_user.friends
    k = []
    mutual.each do |m|
      r = m.friends.include?(user)
      k << User.find(user.id)
    end
    return k
  end
end