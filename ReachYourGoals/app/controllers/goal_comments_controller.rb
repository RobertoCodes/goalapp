class GoalCommentsController < ApplicationController

  before_action :require_logged_in

  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.author_id = current_user.id
    @goal_comment.save
    flash[:errors] = @goal_comment.errors.full_messages
    redirect_to goal_url(@goal_comment.goal)
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])
    @goal_comment.destroy
    redirect_to goal_url(@goal_comment.goal)
  end

  private

  def goal_comment_params
    params.require(:goal_comment).permit(:body, :author_id, :goal_id)
  end

end
