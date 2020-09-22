class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/restaurants/#{comment.restaurant.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
  end
end
