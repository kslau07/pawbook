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
require 'rails_helper'

# TODO: Add factory bot, then create a user
# Build a Post with that user. Save it.
# Add test for User.first.posts
# TODO: After above test passes, create a commentable polymorphic model
# TODO: Utilize guard gem
RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :pets_name }
  end

  describe 'Associations' do
    it { should have_many :posts }
    it { should have_one :profile }
  end

  let!(:user) { create(:user) }
end
