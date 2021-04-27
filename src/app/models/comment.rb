# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#
class Comment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :article
  belongs_to :user

  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 }
end
