class Sighting < ApplicationRecord
  extend FriendlyId
  
  belongs_to :pet
  validates :pet_type, presence: true
  validates :last_seen_at, presence: true
  validates :date_time, presence: true
  mount_uploader :image, ImageUploader

  friendly_id :slug_candidates, use: [:slugged, :history]
  
  def slug_candidates
    [:pet_type, :last_seen_at]
  end
end
