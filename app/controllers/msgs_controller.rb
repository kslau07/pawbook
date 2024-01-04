class MsgsController < ApplicationController
  def create
    msg = Msg.create!(msg_params)
    # TODO: Very simple chat id, consider hash value of usernames etc.
    chat_id = [current_user.id.to_s, msg_params[:msg_recipient_id]].sort.join('') 
    ActionCable.server.broadcast("msg_channel_#{chat_id}",msg.as_json(include: :msg_sender))
  end

  private

  def msg_params
    params.require(:msg).permit(:msg_recipient_id, :body)
          .merge(msg_sender_id: current_user.id)
  end
end
