class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  validates :image_data, presence: true
end
