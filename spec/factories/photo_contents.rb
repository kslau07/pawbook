# == Schema Information
#
# Table name: photo_contents
#
#  id                  :bigint           not null, primary key
#  content :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :photo_content do
    content { "MyString" }
  end
end
