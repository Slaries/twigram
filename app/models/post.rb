class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  validates :content, presence: true
  validates :image_data, presence: true
end
