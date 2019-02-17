class Photographer < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :customers
  has_many :messages, as: :messageable
  has_many :posts
  has_many :requests
  has_many :applied_posts, through: :requests, source: :post
  has_many :galleries
  has_one_attached :avatar

  validates :name, presence: true
  validates :phone, presence: true
  validates :location, presence: true

  def apply post
    applied_posts << post
  end

  def cancel_request  post
    applied_posts.delete post
  end

  def applied? post
    applied_posts.include? post
  end
end
