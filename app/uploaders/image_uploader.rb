class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [80, 80]
  end

  version :medium do
    process resize_to_fit: [300, 300]
  end

  version :large do
    process resize_to_fit: [600, 600]
  end
end
