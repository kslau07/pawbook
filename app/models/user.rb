# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  pets_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
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
         :recoverable, :rememberable, :validatable

  has_many :requests_sent, class_name: 'FriendRequest', foreign_key: :sender_id, dependent: :destroy
  has_many :requests_received, class_name: 'FriendRequest', foreign_key: :recipient_id, dependent: :destroy
  has_many :friends_sent, -> { merge(FriendRequest.confirmed) }, through: :requests_sent
  # has_many :friends_received
  # has_many :pending_requests_sent
  # has_many :pending_requests_received

  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :reactions, dependent: :destroy

  # TODO: check if dependent:destroy would orphan existing nested comments from other users
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  has_one :profile, dependent: :destroy
  validates :pets_name, presence: true
end
