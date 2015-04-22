class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
   
    
    if @comment.save
     
      flash[:notice] = "Your comment was created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
  
  def show
    @comments = Comments.all
  end

  private
  
  def comment_params
    
    params.require(:comment).permit!
  end

end