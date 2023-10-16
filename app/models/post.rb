# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  postable_type :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :bigint           not null
#  postable_id   :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, as: :reactionable, dependent: :destroy
  delegated_type :postable, types: %w[PhotoContent TextContent]
  validates :postable_id, presence: true
  validates :postable_type, presence: true
end
