class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :photographer, optional: true

  validates :title, presence: true, length: {in: 5..50}
  validates :hourly_rate, numericality: {greater_than: 0}
  validates :title, presence: true
  validates :location, presence: true
end
