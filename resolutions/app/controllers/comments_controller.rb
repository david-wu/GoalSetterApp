class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      if comment_params[:sayable_type]=="User"
        redirect_to user_url(comment_params[:sayable_id])
      elsif comment_params[:sayable_type]=="Goal"
        redirect_to goal_url(comment_params[:sayable_id])
      end
    else
      flash[:error] = "Andrew sucks"
      redirect_to user_url(comment_params[:sayable_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :sayable_type, :sayable_id)
  end
end
