# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  title      :string(255)      not null
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  has_many :comments
  
  validates :name, presence: true, length: { maximum: 10}
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 1000}
end
