class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true, length: {maximum: 140}
  validates :image_data, presence: true
end
