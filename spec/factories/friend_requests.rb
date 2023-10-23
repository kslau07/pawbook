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
#  index_friend_requests_on_recipient_id  (recipient_id)
#  index_friend_requests_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
FactoryBot.define do
  factory :friend_request do
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end
