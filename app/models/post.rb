class Post < ApplicationRecord
  include PublicActivity::Common

  belongs_to :customer
  belongs_to :photographer, optional: true
  has_many :requests
  has_many :candidates, through: :requests, source: :photographer
  has_many :messages

  enum status: {available: 0, applied: 1, finished: 2, closed: 3}

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, presence: true, length: {in: 5..50}
  validates :hourly_rate, numericality: {greater_than: 0}
  validates :title, presence: true
  validates :location, presence: true

  scope :latest, ->{order id: :desc}
  scope :by_customer, -> customer {where customer: customer}
end
