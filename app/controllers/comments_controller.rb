class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:id])
    @comment.post_id = @post.id

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Comment could not be ccreated!!'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
