# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string           not null
#  content          :text             not null
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
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }

    xit 'belongs to commentable, a polymorphic association' do
      expect(subject).to belong_to(:postable)
    end
  end

  describe 'Validations' do
    xit { should validate_presence_of :content }
    xit { should validate_presence_of :commentable_id }
    xit { should validate_presence_of :commentable_type }
  end
end
