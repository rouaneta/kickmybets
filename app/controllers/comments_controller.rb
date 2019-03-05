class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @participation = Participation.find(params[:participation_id])
    @comment.participation = @participation
    @comment.save!
  end

  private

  def comment_params
    params.require(:comment).permit(:resource_id, :resource_type, :content)
  end
end


