require "image_processing/mini_magick"
class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :derivatives
  plugin :cached_attachment_data
  plugin :remove_attachment
  plugin :determine_mime_type, analyzer: :marcel
  plugin :validation_helpers
  plugin :default_url

  Attacher.validate do
    validate_extension %w[jpg jpeg png webp]
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size 1*1024*1024 # 1 MB
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
        small:  magick.resize_to_limit!(300, 300),
        large:  magick.resize_to_limit!(800, 800),
    }
  end

  Attacher.default_url do |**options|
    "/placeholders/missing.jpg"
  end

end