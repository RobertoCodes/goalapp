class UserCommentsController < ApplicationController

  before_action :require_logged_in

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.author_id = current_user.id
    @user_comment.save
    flash[:errors] = @user_comment.errors.full_messages
    redirect_to user_url(@user_comment.recipient)
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    redirect_to user_url(@user_comment.recipient)

  end



  private

    def user_comment_params
      params.require(:user_comment).permit(:body, :author_id, :recipient_id)
    end

end
