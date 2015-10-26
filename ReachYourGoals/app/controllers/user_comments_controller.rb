class UserCommentsController < ApplicationController

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.author_id = current_user.id
    @user_comment.save
    flash.now[:errors] = @user_comment.errors.full_messages
    redirect_to user_url(@user_comment.recipient)
  end



  private

    def user_comment_params
      params.require(:user_comment).permit(:body, :author_id, :recipient_id)
    end

end
