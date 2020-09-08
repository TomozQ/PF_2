class Gossip < ApplicationRecord
  has_many :gossip_users
  has_many :users, through: :gossip_users
  validates :name, presence: true, uniqueness: true
end
