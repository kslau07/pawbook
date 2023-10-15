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

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts).dependent(:destroy).with_foreign_key(:author_id) }
    it { should have_one :profile }

    describe '.posts.create' do
      let!(:user) { create(:user) }

      before(:example) do
        post_body = 'My post'
        user.posts.create(body: post_body)
      end

      it 'creates a post associated with a user' do
        expect(user.posts.first.body).to eq 'My post'
      end
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :pets_name }
  end
end
