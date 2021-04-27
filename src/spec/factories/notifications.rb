# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#  comment_id :integer
#  message_id :integer
#  room_id    :integer
#  visited_id :integer          not null
#  visitor_id :integer          not null
#
FactoryBot.define do
  factory :notification do
    
  end
end
