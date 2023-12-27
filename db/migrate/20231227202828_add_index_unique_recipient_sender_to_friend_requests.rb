class AddIndexUniqueRecipientSenderToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_index :friend_requests, %i[recipient_id sender_id], unique: true
  end
end
