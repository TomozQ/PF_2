class ChatsController < ApplicationController
  before_action :set_gossip

  def index
    @chat = Chat.new
    @chats = @gossip.chats.includes(:user)
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = @gossip.chats.new(chat_params)
    if @chat.save
      redirect_to gossip_chats_path(@gossip), notice: 'chatが送信されました'
    else
      @chats = @gossip.chats.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
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
