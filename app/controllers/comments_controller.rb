class CommentsController < ApplicationController
  before_action :set_concert

  def create
    unless current_user
      redirect_to new_user_session_path, :flash => { :danger => "Please sign in or sign up to comment." }
    else
      @comment = @concert.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        flash[:success] = "Comment has been created successfully."
      else
        flash.now[:danger] = "Comment has not been created."
      end

      redirect_to concert_path(@concert)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def set_concert
    @concert = Concert.find(params[:concert_id])
  end
end
