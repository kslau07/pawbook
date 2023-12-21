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
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
    it { should have_many(:reactions).dependent(:destroy) }
    it { should belong_to(:commentable) }
  end

  describe 'Validations' do
    it { should validate_presence_of :body }
  end
end
