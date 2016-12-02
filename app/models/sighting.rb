class Sighting < ApplicationRecord
  reverse_geocoded_by :lat, :long
  after_validation :reverse_geocode
  belongs_to :pet
  validates :pet_type, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :last_seen_date, presence: true
  validates :last_seen_time, presence: true
  mount_uploader :image, ImageUploader
end
