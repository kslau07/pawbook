# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  body          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pet_parent_id :bigint           not null
#
# Indexes
#
#  index_posts_on_pet_parent_id  (pet_parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_parent_id => users.id)
#
require 'rails_heLper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :body }
  end

  describe 'Associations' do
    it { should belong_to :pet_parent }
  end
end
