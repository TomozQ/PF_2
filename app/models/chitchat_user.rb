class ChitchatUser < ApplicationRecord
  belongs_to :chitchat
  belongs_to :user
end
