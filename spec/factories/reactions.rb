# == Schema Information
#
# Table name: reactions
#
#  id                :bigint           not null, primary key
#  reactionable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reactionable_id   :integer
#  user_id           :bigint           not null
#
# Indexes
#
#  index_reactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :reaction do
    user { nil }
    reactionable_id { 1 }
    reactionable_type { "MyString" }
  end
end
