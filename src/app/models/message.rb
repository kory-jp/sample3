# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  context    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :room

  def create_notification_message!(current_user, room, message)
    @roomMemberNotMe = Membership.where(room_id: room.id).where.not(user_id: current_user.id)
    @visitedId = @roomMemberNotMe.find_by(room_id: room.id)
    notification = current_user.active_notifications.new(
      room_id: room.id,
      message_id: message.id,
      visited_id: @visitedId.user_id,
      visitor_id: current_user.id,
      action: 'dm'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
