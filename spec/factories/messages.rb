# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :message do
    body { "MyString" }
    user { nil }
  end
end
