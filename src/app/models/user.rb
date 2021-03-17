# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
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
  has_many :articles, dependent: :delete_all
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article

  has_secure_password

  validates :name,  presence: true, length: {maximum: 18}
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
end
