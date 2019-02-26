class Request < ApplicationRecord
  belongs_to :post
  belongs_to :photographer
end
