class MsgsController < ApplicationController
  def create
    @msg = current_user.msgs.build(msg_params)
    @msg.save
    ActionCable.server.broadcast('msg', @msg.as_json(include: :user))
  end

  private

  def msg_params
    params.require(:msg).permit(:body)
  end
end
