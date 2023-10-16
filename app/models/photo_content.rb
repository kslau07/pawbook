# == Schema Information
#
# Table name: photo_contents
#
#  id                  :bigint           not null, primary key
#  content :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class PhotoContent < ApplicationRecord
  has_one :post, as: :postable, dependent: :destroy
  validates :content, presence: true
end
