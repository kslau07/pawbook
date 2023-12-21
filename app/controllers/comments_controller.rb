class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    # post = Post.find(params[:post_id])
    comment = @commentable.comments.build(comment_params)
    # comment = post.comments.create(comment_params)

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

  def set_commentable
    @commentable = find_commentable
  end

  # Set a polymorphic association with meta-programming
  # SOURCE: https://discuss.rubyonrails.org/t/in-your-opinion-whats-the-best-way-to-deal-with-nested-resources-when-polymorphic-associations-are-in-play/75981
  def find_commentable
    params.each do |name, value|
      if /(.+)_id$/ =~ name
        return ::Regexp.last_match(1).classify.constantize.find(value)
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :body)
          .merge(author: current_user)
  end
end
