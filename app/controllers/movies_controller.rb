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
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :director, :original, :actor, :image).merge(user_id: current_user.id)
  end
end
