# == Schema Information
#
# Table name: photo_contents
#
#  id                  :bigint           not null, primary key
#  placeholder_content :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class PhotoContent < ApplicationRecord
  has_one :post, as: :postable, dependent: :destroy
  validates :placeholder_content, presence: true
end
