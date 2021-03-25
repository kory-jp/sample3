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
FactoryBot.define do
  factory :user do
    id {"99"}
    name {"sample"}
    sequence(:mail) { |n| "sample#{n}@example.com"}
    password {"password"}
  end
end
