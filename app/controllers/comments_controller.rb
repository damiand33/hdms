class CommentsController < ApplicationController
  before_action :authenticate_user! # Requires that a user is logged in prior to adding a comment.
  def create
    @worksheet = Worksheet.find(params[:worksheet_id]) # Loads the worksheet the comment belongs to
    @worksheet.comments.create(comment_params.merge(user: current_user)) # add comment to the Db
    redirect_to worksheet_path(@worksheet) # send the user back to the worksheet details page
  end

  def comment_params
    params.require(:comment).permit(:message, :priority) # pull data out of the comments form
  end
end
