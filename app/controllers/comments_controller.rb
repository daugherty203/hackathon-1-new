class CommentsController < ApplicationController
  before_action :set_movie
before_action :set_comment, only: [:show, :update, :edit, :delete]

  def index
    @comments = @movie.comments
  end

  def show
  end

  def new
    @comment = @movie.comments.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
  @comment = @movie.comments.new(comment_params)

    if @comment.save
      redirect_to [@movie, @topic]
    else 
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@movie, @comment]
    else
      render :edit
    end
  end

  def delete
    @comment.destroy
    redirect_to movie_comment_path
  end

private
def set_movie
  @movie = Movie.find(params[:movie_id])
end  

def set_comment
    @comment = Comment.find(params[:id])
  end


  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :body)
  end
end
