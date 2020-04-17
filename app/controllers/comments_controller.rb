class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: :back)
    else
      flash[:danger] = "投稿できませんでした"
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      redirect_back(fallback_location: :back)
    else
      @comment.destroy
      redirect_back(fallback_location: :back)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :book_id)
  end


end
