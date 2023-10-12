# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
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
  let!(:post) { create(:post) }

  describe 'Validations' do
    it { should validate_presence_of :body }
  end

  describe 'Associations' do
    it { should belong_to :author }
  end
end
