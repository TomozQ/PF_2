class Movie < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, unless: :image?
  validates :director, presence: true
  validates :summary, presence: true
end
