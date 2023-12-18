class ReactionsController < ApplicationController
  before_action :set_reactionable

  # TODO: Use turbo-stream to update associated post, comment, etc.
  def create
    @reaction = Reaction.new(reaction_params)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Reaction created' } if @reaction.save
    end
  end

  def destroy; end

  private

  def set_reactionable
    @reactionable = find_reactionable
  end

  # Poly. associations - finding the parent/associated model
  # SOURCE: https://discuss.rubyonrails.org/t/in-your-opinion-whats-the-best-way-to-deal-with-nested-resources-when-polymorphic-associations-are-in-play/75981/1
  # returns parent Post, Comment, etc. record that is reactionable
  def find_reactionable
    params.each do |key, value|
      return ::Regexp.last_match(1).classify.constantize.find(value) if key =~ /(.+)_id$/
    end
  end

  def reaction_params
    params.require(:reaction).permit(:reactionable_id, :reactionable_type, :kind)
          .merge(user_id: current_user.id)
          .merge(kind: params[:reaction][:kind].to_i)
  end
end
