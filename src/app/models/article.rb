# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  image_data :text(65535)
#  name       :string(255)      not null
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
class Article < ApplicationRecord
  include ImageUploader[:image]
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 10}
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 1000}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
