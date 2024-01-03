class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @msg = Msg.new
    @msgs = Msg.includes(:user)
  end

  def show; end
  def create; end
end
