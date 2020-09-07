class User < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {maximum: 40}
  validates :email, presence: true, uniqueness: true
end
