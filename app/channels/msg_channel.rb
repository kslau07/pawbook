class MsgChannel < ApplicationCable::Channel
  def subscribed
    stream_from "msg_channel_#{params[:chat_id]}" 
    # stream_from 'msg'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def receive(data)
  #   # data['user'] = current_user
  #   ActionCable.server.broadcast('msg', data)
  # end
end
