# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text             not null
#  commentable_type :string           not null
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
  include Reactionable

  belongs_to :author, class_name: 'User'
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  validates :body, presence: true
  # validates :commentable_id, presence: true
  # validates :commentable_type, presence: true

  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications # ✅
    # return if author == post.author

    CommentNotification.with(message: self).deliver_later(commentable.author)

    broadcast_prepend_to 'panda',
                         target: 'panda',
                         partial: 'notifications/notification',
                         locals: { unread: true }
    # broadcast_prepend_to "notifications_#{post.author.id}",
    # target: "notifications_#{post.author.id}",
    # locals: { author:, post:, unread: true }
  end
end
