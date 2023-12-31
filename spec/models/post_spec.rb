# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  postable_type :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :bigint           not null
#  postable_id   :integer          not null
#
# Indexes
#
#  index_posts_on_author_id   (author_id)
#  index_posts_on_created_at  (created_at)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should belong_to :author }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:reactions).dependent(:destroy) }
    it { should belong_to(:postable) }
  end

  describe 'Validations' do
  end
end
