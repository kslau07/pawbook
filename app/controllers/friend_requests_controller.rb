class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)
    @recipient = User.find(friend_request_params[:recipient_id])
    @friend_request_already_sent = true

    if @friend_request.save
      respond_to do |format|
        format.html { redirect_to user_path(@recipient.username), notice: 'Friend request was successfully sent.' }
        format.turbo_stream
      end
    else
      render user_path(@recipient.username), status: :unprocessable_entity
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:recipient_id, :sender_id, :confirmed)
  end
end
