class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # check if friend request exists
    @user = User.find_by(username: params[:_username]) || current_user
    @friend_request_outgoing_sent = current_user.requests_sent.find_by(recipient_id: @user.id)
    # TODO: Show confirm button on other user's page if they have sent a request
    @friend_request_incoming_received = current_user.requests_received.find_by(sender_id: @user.id)
    # @friend_request_incoming_received = @user != current_user && current_user.requests_sent.find_by(recipient_id: @user.id)
    @posts = @user.posts
    @post = Post.postable_new
  end
end

# <% @user.pending_requests_received.each do |request_received| %>
#   <div class="grid py-2 px-4 bg-neutral-50 grid-cols-[1fr_auto_auto]">
#     <%= link_to request_received.sender.username, user_path(request_received.sender.username) %>
#     <%= button_to "Confirm", friend_request_path(request_received.id), class: "bg-white hover:bg-gray-100 text-green-500 font-semibold py-1 px-2 text-xs border border-gray-400 rounded",
#                 params: { friend_request: { confirmed: "true" }}, method: :patch %>
#     <%= button_to "Ignore", friend_request_path(request_received.id), class: "ml-2 bg-white hover:bg-gray-100 text-gray-500 font-semibold py-1 px-2 text-xs border border-gray-400 rounded",
#                 method: :delete %>
#   </div>
# <% end %>
