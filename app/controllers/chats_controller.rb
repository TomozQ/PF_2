class ChatsController < ApplicationController
  before_action :set_gossip

  def index
    @chat = Chat.new
    @chats = @gossip.chats.includes(:user)
    @nums = @gossip.chats.count
  end

  def new
    @chat = Chat.new
    @chats = @gossip.chats.includes(:user)
  end

  def create
    @chat = @gossip.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.json
      end
    else
      @chats = @gossip.chats.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
end
