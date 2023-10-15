# == Schema Information
#
# Table name: text_contents
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe TextContent, type: :model do
  describe 'Associations' do
    # docs say poly. associations are automatically detected
    # https://github.com/thoughtbot/shoulda-matchers/blob/c17bac468c5c5e4ca6808f7232abaca090f71e26/lib/shoulda/matchers/active_record/association_matcher.rb#L346C1-L347C1
    it { should have_one(:post) }
  end

  describe 'Validations' do
    it { should validate_presence_of :content }
  end
end
