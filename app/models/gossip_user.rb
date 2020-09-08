class GossipUser < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
end
