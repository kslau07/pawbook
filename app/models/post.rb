# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  body          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pet_parent_id :bigint           not null
#
# Indexes
#
#  index_posts_on_pet_parent_id  (pet_parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_parent_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :pet_parent, class_name: 'User'
  validates :body, presence: true
end
