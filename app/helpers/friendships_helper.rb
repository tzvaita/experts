module FriendshipsHelper
  def friend_request_sent?(user)
    current_user.friend_sent.exists?(sent_to_id: user.id, status: false)
  end
  
  def friend_request_received?(user)
    current_user.friend_request.exists?(sent_by_id: user.id, status: false)
  end
  
  def possible_friend?(user)
    request_sent = current_user.friend_sent.exists?(sent_to_id: user.id)
    request_received = current_user.friend_request.exists?(sent_by_id: user.id)
    
    return true if request_sent != request_recieved    
    return true if request_sent == request_recieved && request_sent == true    
    return false if request_sent == request_recieved && request_sent == false
  end
end
