class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end
