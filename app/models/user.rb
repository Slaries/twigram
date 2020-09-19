class User < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  has_many :follower_follows, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :following_follows, source: :following

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  validates :name, presence: true, length: {maximum: 40}
  validates :email, presence: true, uniqueness:  { case_sensitive: false},
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end

  def apply_omniauth(auth)
    update_attributes(
        provider: auth.provider,
        uid: auth.uid
    )
  end

  def has_facebook_linked?
    self.provider.present? && self.uid.present?
  end
end
