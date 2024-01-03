class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @msg = Msg.new
    @msgs = Msg.includes(:user)

    @users = User.all
  end

  def show
    @sender = current_user
    @recipient = User.find(params[:recipient_id])
    @msgs = Msg.where(msg_sender_id: @sender.id, msg_recipient_id: @recipient.id)
               .or(Msg.where(msg_sender_id: @recipient.id, msg_recipient_id: @sender.id)) # Include inverse of pair
    @chat_id = [@sender.id, @recipient.id].sort.join('') # generates a unique identifier for a pair of user
  end
end
