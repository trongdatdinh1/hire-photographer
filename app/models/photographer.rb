class Photographer < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :customers
  has_many :messages, as: :messageable
  has_many :posts
  has_one_attached :avatar

  validates :name, presence: true
  validates :phone, presence: true
  validates :location, presence: true
end
