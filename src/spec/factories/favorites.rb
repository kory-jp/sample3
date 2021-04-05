# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_article_id              (article_id)
#  index_favorites_on_user_id                 (user_id)
#  index_favorites_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :favorite do
    # user { nil }
    # article { nil }

    association :user,
    factory: :user

    association :article,
    factory: :article
  end
end
