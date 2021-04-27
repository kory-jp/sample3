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
class Notification < ApplicationRecord
  default_scope -> {order(created_at: :desc)}
  belongs_to :article, optional: true
  belongs_to :comment, optional: true
  belongs_to :room, optional: true
  belongs_to :message, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
