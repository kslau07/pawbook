class ReactionsController < ApplicationController
  # before_action :set_reactionable

  # TODO: Use turbo-stream to update associated post, comment, etc.
  def create
    @reaction = Reaction.new(reaction_params)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Reaction created' } if @reaction.save
    end
  end

  def update
    @reaction = Reaction.find_by(reaction_params.except(:kind))
    @reaction.kind = reaction_params[:kind]
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Reaction created' } if @reaction.save
    end
  end

  def destroy
    @reaction = Reaction.find_by(reaction_params)
    @reaction.destroy
    redirect_to root_path
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reactionable_id, :reactionable_type, :kind)
          .merge(user_id: current_user.id)
          .merge(kind: params[:reaction][:kind].to_i)
  end
end
