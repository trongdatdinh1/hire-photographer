class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]


  has_and_belongs_to_many :photographers
  has_many :messages, as: :messageable
  has_many :posts

  validates :name, presence: true

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0, 20]
      customer.name = auth.info.name
      customer.avatar = auth.info.image
      customer.uid = auth.uid
      customer.provider = auth.provider
    end
  end
end
