# == Schema Information
#
# Table name: mixed_contents
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe MixedContent, type: :model do
  describe 'Associations' do
    it { should have_one(:post).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of :content }
  end
end
