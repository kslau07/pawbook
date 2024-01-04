# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.

  # NOTE: This gives us access to the params
  #       This is a bit deceptive because we are actually grabbing the
  #       params for message, which contains our comment
  def comment
    params[:message]
  end

  def creator
    comment.author # NOTE: Uses above method, accesses the creator/user
  end

  def post
    comment.post
  end

  def url
    post_path(params[:post])
  end
end
