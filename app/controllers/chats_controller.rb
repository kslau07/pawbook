class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @message = Message.new
    @messages = Message.includes(:user)
  end
end
