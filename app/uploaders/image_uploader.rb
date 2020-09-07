require "image_processing/mini_magick"
class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :derivatives
  plugin :cached_attachment_data
  plugin :remove_attachment
  plugin :validation_helpers
  plugin :determine_mime_type, analyzer: :marcel
  plugin :validation_helpers

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

  Attacher.validate do
    validate_max_size 1.megabytes, message: 'is too large (max is 1 MB)'
    validate_mime_type_inclusion %w[image/jpeg image/jpg image/png image/gif]
  end

end