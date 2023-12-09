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
  pending "add some examples to (or delete) #{__FILE__}"
end
