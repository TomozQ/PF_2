class ChitchatsController < ApplicationController
  def new
    @chitchat = Chitchat.new
    @chitchat.users << current_user
  end

  def create
    @chitchat = Chitchat.new(chitchat_params)
    if @chitchat.save
      redirect_to chitchats_path, notice: 'スレッドを作成しました'
    else
      render :new
    end
  end

  def index
    @chitchats = Chitchat.all
  end


  private
  def chitchat_params
    params.require(:chitchat).permit(:name, user_ids: [])
  end
end
