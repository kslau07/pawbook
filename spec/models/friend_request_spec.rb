# == Schema Information
#
# Table name: friend_requests
#
#  id           :bigint           not null, primary key
#  confirmed    :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_friend_requests_on_recipient_id  (recipient_id)
#  index_friend_requests_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'Associations' do
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end

  describe 'Validations' do
  end

  describe 'Scopes' do
    describe '.confirmed' do
      describe 'when a friend request has not been accepted (default state)' do
        let!(:default_request) { create(:friend_request) }

        it 'is not included in the results' do
          scoped_result = FriendRequest.confirmed
          expect(scoped_result).not_to include default_request
        end
      end

      describe 'when a friend request has been accepted' do
        let!(:request) { create(:friend_request) }

        it 'will be included in the results' do
          request.confirmed = true
          request.save
          request.reload
          scoped_result = FriendRequest.confirmed
          expect(scoped_result).to include request
        end
      end
    end

    describe '.unconfirmed' do
      describe 'when a friend request has not been accepted (default state)' do
        let!(:default_request) { create(:friend_request) }

        it 'will be included in the results' do
          scoped_result = FriendRequest.unconfirmed
          expect(scoped_result).to include default_request
        end
      end

      describe 'when a friend request has been accepted' do
        let!(:request) { create(:friend_request) }

        it 'will not be included in the results' do
          request.confirmed = true
          request.save
          request.reload
          scoped_result = FriendRequest.unconfirmed
          expect(scoped_result).not_to include request
        end
      end
    end
  end
end
