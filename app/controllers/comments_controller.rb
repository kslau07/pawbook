class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params)

    respond_to do |format|
      if comment.save
        format.html { redirect_to root_path, notice: 'Comment created' }
      else
        # format.html { render :new, status: :unprocessable_entity } # TODO: Raise error on form
      end
    end
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
          .merge(author: current_user)
  end
end
