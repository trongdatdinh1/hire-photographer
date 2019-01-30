class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :photographers
  has_many :messages, as: :messageable
  has_many :posts

  validates :name, presence: true
end
