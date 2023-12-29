class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friend_request = FriendRequest.new(friend_request_params)
    @user = User.find(friend_request_params[:recipient_id])
    @friend_request_already_sent = true

    if @friend_request.save
      respond_to do |format|
        format.html { redirect_to user_path(@user.username), notice: 'Friend request was successfully sent.' }
        format.turbo_stream
      end
    else
      render user_path(@user.username), status: :unprocessable_entity
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    return unless @friend_request.recipient == current_user

    @friend_request.confirmed = true

    if @friend_request.save
      respond_to do |format|
        format.html { redirect_to "/users/#{current_user.username}/friends" }
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    nil unless @friend_request.recipient == current_user

    @friend_request.destroy!
    redirect_to "/users/#{current_user.username}/friends"
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:recipient_id, :sender_id, :confirmed)
  end
end
