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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts).dependent(:destroy).with_foreign_key(:author_id) }
    it { should have_many(:comments).dependent(:destroy).with_foreign_key(:author_id) }
    # it { should have_one(:dashboard).dependent(:destroy) } # Dashboard exists as view only
    it { should have_many(:reactions).dependent(:destroy) }
    it { should have_many(:requests_sent).dependent(:destroy).with_foreign_key(:sender_id) }
    it { should have_many(:requests_received).dependent(:destroy).with_foreign_key(:recipient_id) }
    it { should have_many(:friends_sent).source(:recipient) }
    it { should have_many(:friends_received).source(:sender) }
    it { should have_many(:pending_requests_sent).with_foreign_key(:sender_id) }
    it { should have_many(:pending_requests_received).with_foreign_key(:recipient_id) }

    describe '.posts.create(postable: photoContent)' do
      let!(:user) { create(:user) }

      before(:example) do
        photo_cont = 'A picture of a cat'
        user.posts.create!(postable: PhotoContent.create!(content: photo_cont))
      end

      it 'creates a post with photo content associated with a user' do
        expect(user.posts.first.postable.content).to eq 'A picture of a cat'
      end
    end

    describe '.posts.create(postable: TextContent)' do
      let!(:user) { create(:user) }

      before(:example) do
        text_cont = 'My first post'
        user.posts.create!(postable: TextContent.create!(content: text_cont))
      end

      it 'creates a post with text content associated with a user' do
        expect(user.posts.first.postable.content).to eq 'My first post'
      end
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :username }

    xit 'username cannot be under 5 chars' do
    end
    xit 'username cannot be over 30 chars' do
    end
    xit 'username cannot contain special chars except underscores and periods' do
    end
  end
end
