class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, unless: :image?
  validates :director, presence: true
  validates :summary, presence: true

  mount_uploader :image, ImageUploader

end
