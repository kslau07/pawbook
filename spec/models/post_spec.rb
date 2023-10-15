# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  postable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :bigint           not null
#  postable_id   :integer
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  # let!(:post) { create(:post) }
  
  describe 'Associations' do
    it { should belong_to :author }

    it 'belongs to postable, a polymorphic association' do
      expect(subject).to belong_to(:postable)
    end
  end

  describe 'Validations' do
    # it { should validate_presence_of :body }
  end
end
