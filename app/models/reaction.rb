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
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true
  validates :reactionable_id, presence: true
  validates :reactionable_type, presence: true
end
