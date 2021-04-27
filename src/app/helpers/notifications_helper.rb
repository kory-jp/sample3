module NotificationsHelper
  def notification_form(notification)
    visitor = link_to notification.visitor.name, notification.visitor
    your_article = link_to 'あなたの投稿', notification.article, remote: true
    case notification.action
    when "follow" then
      "#{visitor}があなたをフォローしました"
    when "favorite" then
      "#{visitor}が#{your_article}にいいね!をしました"
    when "comment" then
      "#{visitor}が#{your_article}にコメントしました"
    when "dm" then
      "#{visitor}があなたにDMをしました"
    end
  end

  def unchecked_notifications
    @notifications = @current_user.passive_notifications.where(checked: false)
  end
end
