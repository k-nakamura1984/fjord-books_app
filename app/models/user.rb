# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon

  validate :icon_type, :icon_size

  private

  def icon_type
    errors.add(:icon, :invalid_file_type) if icon.blob.present? && !icon.blob.content_type.in?(%('image/jpg image/jpeg image/png image/gif'))
  end

  def icon_size
    errors.add(:icon, :invalid_file_size) if icon.blob.present? && (icon.blob.byte_size > 1.megabytes)
  end
end
