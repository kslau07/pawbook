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

  validate :correct_image_mime_type

  def image_width300(img)
    img.variant(resize_to_limit: [600, nil]).processed
  end

  def self.postable_new
    postable_new = Post.new(postable_type: 'TextContent')
    postable_new.build_postable
    postable_new
  end

  private

  def correct_image_mime_type
    return unless images.attached?

    images.each do |image|
      next if image.content_type.in?(%w[image/jpeg image/jpg image/png])

      images.purge
      errors.add(:images, 'must be .jpg, .jpeg, or .png')

      # return unless image.content_type.in?(%w[image/jpeg image/jpg image/png])
    end
  end
end
