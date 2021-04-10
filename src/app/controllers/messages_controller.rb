class MessagesController < ApplicationController
  def create
    if Membership.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      redirect_to root_path(@message.room_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :room_id, :context).merge(user_id: current_user.id)
  end
end