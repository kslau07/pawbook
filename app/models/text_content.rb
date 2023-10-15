# == Schema Information
#
# Table name: text_contents
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TextContent < ApplicationRecord
  has_one :post, as: :postable, dependent: :destroy
  validates :content, presence: true
end
