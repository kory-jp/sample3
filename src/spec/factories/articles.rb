# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  image_data :text(65535)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :article do
    id {"1"}
    name {"sampleName"}
    title {"sampleTitle"}
    body {"sampleBody"}
    created_at {"2021-03-15 18:28:12.343235000 +0900"}
    updated_at {"2021-03-15 18:28:12.343235000 +0900"}

    association :user,
    factory: :user
  end
end
