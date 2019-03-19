class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  has_and_belongs_to_many :photographers
  has_many :messages, as: :messageable
  has_many :posts

  validates :name, presence: true

  def update_phone_number number
    self.phone = number
    save
  end

  def generate_pin
    self.pin = SecureRandom.hex 2
    self.phone_verified = false
    save
  end

  def send_pin
    client = Twilio::REST::Client.new
    client.messages.create ({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: self.phone,
      body: I18n.t(".your_pin_is", pin: self.pin)
    })
  end

  def verify_pin entered_pin
    update phone_verified: true if self.pin == entered_pin
  end

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
