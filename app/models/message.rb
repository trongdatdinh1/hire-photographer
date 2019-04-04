class Message < ApplicationRecord
  include PublicActivity::Common

  belongs_to :post
  belongs_to :messageable, polymorphic: true

  validates :content, presence: true

  scope :latest, ->{order id: :desc}

  after_create_commit { MessageBroadcastJob.perform_later self}
end
