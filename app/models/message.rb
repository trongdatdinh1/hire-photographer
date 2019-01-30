class Message < ApplicationRecord
  belongs_to :post
  belongs_to :messageable, polymorphic: true

  validates :content, presence: true
end
