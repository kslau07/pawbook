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
#  index_posts_on_author_id   (author_id)
#  index_posts_on_created_at  (created_at)
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
  accepts_nested_attributes_for :postable

  # FIX:
  has_many_attached :images
  # has_one_attached :image

  def self.postable_new
    postable_new = Post.new(postable_type: 'TextContent')
    postable_new.build_postable
    postable_new
  end
end
