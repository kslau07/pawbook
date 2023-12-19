# == Schema Information
#
# Table name: reactions
#
#  id                :bigint           not null, primary key
#  kind              :integer          not null
#  reactionable_type :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reactionable_id   :integer          not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_reactions_on_reactionable_id_and_user_id  (reactionable_id,user_id) UNIQUE
#  index_reactions_on_user_id                      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Reaction < ApplicationRecord
  enum kind: { like: 0,
               heart: 1,
               laugh: 2,
               sad: 3 }
  belongs_to :user
  belongs_to :reactionable, polymorphic: true
  validates :reactionable_id, presence: true
  validates :reactionable_type, presence: true
  validates :kind, presence: true
  validates :user_id, uniqueness: { scope: %i[reactionable_id reactionable_type] }
end
