# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string           not null
#  content          :text             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :bigint           not null
#  commentable_id   :integer          not null
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :reactions, as: :reactionable, dependent: :destroy
  validates :content, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
end
