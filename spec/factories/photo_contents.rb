# == Schema Information
#
# Table name: photo_contents
#
#  id                  :bigint           not null, primary key
#  placeholder_content :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :photo_content do
    placeholder_content { "MyString" }
  end
end
