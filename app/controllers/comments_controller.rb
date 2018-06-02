class CommentsController < ApplicationController
before_action :set_comment, only: [:show, :update, :edit, :delete]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
  @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to movie_path
    else 
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def delete
    @comment.destroy
    redirect_to movies_path
  end

private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :body)
  end
end
