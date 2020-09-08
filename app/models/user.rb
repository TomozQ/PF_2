class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gossip_users
  has_many :gossips, through: :gossip_users
  has_many :chats
  has_many :movies

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end
