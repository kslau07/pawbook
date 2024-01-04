# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 github]

  # TODO: Add test
  # Require top-level domain in emails
  validates :email,
            format: { with: %r{\A[a-zA-Z0-9.!\#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+\z} }
  validates :username, uniqueness: true,
                       presence: true, length: { minimum: 3, maximum: 30 },
                       format: { with: /\A[\w.]+\z/,
                                 message: 'can only contain letters, numbers, periods, and underscores' }
  validate :correct_avatar_mime_type

  has_many :notifications, as: :recipient

  # Chat msgs
  has_many :msgee, foreign_key: :msg_recipient_id, class_name: 'Msg'
  has_many :msg_senders, through: :msgee
  has_many :msged, foreign_key: :msg_sender_id, class_name: 'Msg'
  has_many :msg_recipients, through: :msged

  has_many :requests_sent, class_name: 'FriendRequest', foreign_key: :sender_id, dependent: :destroy
  has_many :requests_received, class_name: 'FriendRequest', foreign_key: :recipient_id, dependent: :destroy
  has_many :pending_requests_sent, -> { merge(FriendRequest.unconfirmed) },
           class_name: 'FriendRequest', foreign_key: :sender_id
  has_many :pending_requests_received, -> { merge(FriendRequest.unconfirmed) },
           class_name: 'FriendRequest', foreign_key: :recipient_id

  has_many :friends_sent, -> { merge(FriendRequest.confirmed) }, through: :requests_sent, source: :recipient
  has_many :friends_received, -> { merge(FriendRequest.confirmed) }, through: :requests_received, source: :sender

  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :reactions, dependent: :destroy
  # TODO: Add dependent: :destroy
  has_one :pet
  accepts_nested_attributes_for :pet

  # TODO: check if dependent:destroy would orphan existing nested comments from other users
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  # has_one :dashboard, dependent: :destroy

  has_one_attached :avatar

  # HACK: Returns an array, we lose our ActiveRecord::Relation, how can we
  #       preserve it
  def all_friends_usernames
    f_sent = friends_sent
    f_received = friends_received
    f_all = f_sent + f_received
    f_usernames = f_all.map { |record| record.username }
    f_usernames.sort
  end

  def avatar_as_thumbnail(size)
    return unless avatar.content_type.in?(%w[image/jpeg image/jpg image/png])

    if size == 'small'
      avatar.variant(resize_to_limit: [75, nil]).processed
    elsif size == 'large'
      avatar.variant(resize_to_limit: [200, nil]).processed
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def correct_avatar_mime_type
    return unless avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/jpg image/png])

    avatar.purge
    errors.add(:avatar, 'must be an image.')
  end
end
