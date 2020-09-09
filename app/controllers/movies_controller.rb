class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'movie情報が作成されました'
    else
      @movies = Movie.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    @comments = @movie.comments.includes(:user)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path, notice: '削除しました'
    else
      @movie = Movie.includes(:user)
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :director, :original, :actor, :image).merge(user_id: current_user.id)
  end
end
