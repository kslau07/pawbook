# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  postable_type :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :bigint           not null
#  postable_id   :integer          not null
#
# Indexes
#
#  index_posts_on_author_id   (author_id)
#  index_posts_on_created_at  (created_at)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
FactoryBot.define do
  factory :post do
    trait :text_content do
      postable { TextContent.create(content: 'A text post.') }
    end

    trait :photo_content do
      postable { PhotoContent.create(content: 'A link to a photo.') }
    end

    association :author, factory: :user
  end

  factory :text_post, parent: :post, traits: [:text_content] do
    # Somewhat redundant to above
  end
end
