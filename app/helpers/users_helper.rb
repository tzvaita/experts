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
    user.friends
  end

  def friend_request_sent?(user)
    current_user.friend_sent.exists?(sent_to_id: user.id, status: false)
  end

  # Checks whether or not a user has sent a friend request to the current user
  # returning either true or false
  def friend_request_recieved?(user)
    current_user.friend_request.exists?(sent_by_id: user.id, status: false)
  end

  # Checks whether or not a user has had a friend request sent to them by the current user
  # or if the current user has been sent a friend request by the user
  # returning either true or false
  def possible_friend?(user)
    request_sent = current_user.friend_sent.exists?(sent_to_id: user.id)
    request_recieved = current_user.friend_request.exists?(sent_by_id: user.id)

    return true if request_sent != request_recieved
    return true if request_sent == request_recieved && request_sent == true
    return false if request_sent == request_recieved && request_sent == false
  end

  def friends_already(user)
    Friendship.find_by(sent_by_id: current_user.id, sent_to_id: user.id, status: true) || 
    Friendship.find_by(sent_by_id: user.id, sent_to_id: current_user.id, status: true)
  end

  def me?(user)
    user == current_user
  end
end