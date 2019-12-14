class CommentsController < ApplicationController
def create
    @challenge = Challenge.find(params[:challenge_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.challenge = @challenge
    if @comment.save
      redirect_to challenge_path(@challenge), notice: 'Your comment has been created.'
    else
      render 'challenges/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
