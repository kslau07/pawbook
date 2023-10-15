# == Schema Information
#
# Table name: text_contents
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :text_content do
    content { "MyString" }
  end
end
