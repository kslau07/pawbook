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
    it { should have_many(:comments).dependent(:destroy).with_foreign_key(:author_id) }
    it { should have_one :profile }

    describe '.posts.create(postable: PhotoContent)' do
      let!(:user) { create(:user) }

      before(:example) do
        photo_con = 'A picture of a cat'
        user.posts.create!(postable: PhotoContent.create!(content: photo_con))
      end

      it 'creates a post with photo content associated with a user' do
        expect(user.posts.first.postable.content).to eq 'A picture of a cat'
      end
    end

    describe '.posts.create(postable: TextContent)' do
      let!(:user) { create(:user) }

      before(:example) do
        photo_con = 'My first post'
        user.posts.create!(postable: TextContent.create!(content: photo_con))
      end

      it 'creates a post with text content associated with a user' do
        expect(user.posts.first.postable.content).to eq 'My first post'
      end
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :pets_name }
  end
end
