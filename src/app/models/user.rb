# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  image_data      :text(65535)
#  introduction    :text(65535)
#  mail            :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_mail  (mail) UNIQUE
#
class User < ApplicationRecord
  include ImageUploader[:image]

  has_many :articles, dependent: :delete_all
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  has_many :messages, dependent: :delete_all
  has_many :memberships, dependent: :delete_all
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_secure_password

  validates :name,  presence: true, length: {maximum: 18}
  validates :introduction, length: {maximum: 1000}
  validates :mail,
    presence: true,
    uniqueness: true,
    length: {maximum: 30},
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      message: 'は不正な文字が含まれております'
    }
  validates :password, 
    length: { minimum: 8 }

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
