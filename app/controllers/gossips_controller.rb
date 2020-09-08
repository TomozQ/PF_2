class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
    @gossip.users << current_user
  end
  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossips_path, notice: 'ゴシップを作成しました'
    else
      render :new
    end
  end
  def index
    @gossips = Gossip.all.order("created_at DESC")
  end

  private
  def gossip_params
    params.require(:gossip).permit(:name, user_ids: [])
  end
end
