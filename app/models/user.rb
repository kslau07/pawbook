# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  pets_name              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :requests_sent, class_name: 'FriendRequest', foreign_key: :sender_id, dependent: :destroy
  has_many :requests_received, class_name: 'FriendRequest', foreign_key: :recipient_id, dependent: :destroy
  has_many :friends_sent, -> { merge(FriendRequest.confirmed) }, through: :requests_sent, source: :recipient
  has_many :friends_received, -> { merge(FriendRequest.confirmed) }, through: :requests_received, source: :sender
  has_many :pending_requests_sent, -> { merge(FriendRequest.unconfirmed) },
           class_name: 'FriendRequest', foreign_key: :sender_id
  has_many :pending_requests_received, -> { merge(FriendRequest.unconfirmed) },
           class_name: 'FriendRequest', foreign_key: :recipient_id

  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :reactions, dependent: :destroy

  # TODO: check if dependent:destroy would orphan existing nested comments from other users
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  has_one :profile, dependent: :destroy
  # validates :pets_name, presence: true # TODO: Suggest that user add a pet, but not required

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
