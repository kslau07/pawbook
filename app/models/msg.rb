# == Schema Information
#
# Table name: msgs
#
#  id               :bigint           not null, primary key
#  body             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  msg_recipient_id :bigint           not null
#  msg_sender_id    :bigint           not null
#
# Indexes
#
#  index_msgs_on_msg_recipient_id  (msg_recipient_id)
#  index_msgs_on_msg_sender_id     (msg_sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (msg_recipient_id => users.id)
#  fk_rails_...  (msg_sender_id => users.id)
#
class Msg < ApplicationRecord
  belongs_to :msg_sender, class_name: 'User'
  belongs_to :msg_recipient, class_name: 'User'
  validates :body, presence: true
end
