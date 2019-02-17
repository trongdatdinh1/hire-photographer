class Gallery < ApplicationRecord
  belongs_to :photographer
  has_many :photos

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
  validate :validate_photos

  private

  def validate_photos
    photos.each do |photo|
      if photo.image.attached? && !photo.image.content_type.in?(["image/jpg", "image/jpeg", "image/png"])
        errors.add :photos, :need_to_be_jpg_jpeg_png
      elsif photo.image.attached? == false
        errors.add :photos, :missing
      end
    end
  end
end
