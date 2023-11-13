# == Schema Information
#
# Table name: dashboards
#
#  id                :bigint           not null, primary key
#  placeholder_photo :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_dashboards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Dashboard < ApplicationRecord
  belongs_to :user
  validates :placeholder_photo, presence: true
end
