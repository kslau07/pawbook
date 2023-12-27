# == Schema Information
#
# Table name: friend_requests
#
#  id           :bigint           not null, primary key
#  confirmed    :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_friend_requests_on_recipient_id                (recipient_id)
#  index_friend_requests_on_recipient_id_and_sender_id  (recipient_id,sender_id) UNIQUE
#  index_friend_requests_on_sender_id                   (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates :recipient_id, uniqueness: { scope: %i[sender_id] }

  scope :confirmed, -> { where('confirmed=?', true) }
  scope :unconfirmed, -> { where('confirmed=?', false) }
end
