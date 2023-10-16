# == Schema Information
#
# Table name: reactions
#
#  id                :bigint           not null, primary key
#  reactionable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reactionable_id   :integer
#  user_id           :bigint           not null
#
# Indexes
#
#  index_reactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }

    it 'belongs to "reactionable", a polymorphic association' do
      expect(subject).to belong_to(:reactionable)
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :reactionable_id }
    it { should validate_presence_of :reactionable_type }
  end
end
