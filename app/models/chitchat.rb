class Chitchat < ApplicationRecord
  has_many :chitchat_users
  has_many :users, through: :chitchat_users
  validates :name, presence: true, uniqueness: true
end
