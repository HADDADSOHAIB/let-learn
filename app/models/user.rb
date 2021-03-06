class User < ApplicationRecord
  validates :username, :fullname, :email, presence: true
  validates :username, length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: 'The email is not valid' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :thoughts, foreign_key: :author_id, dependent: :destroy

  has_many :relation_followers, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :relation_followers

  has_many :relation_followeds, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :relation_followeds

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :join_user_rooms
  has_many :rooms, through: :join_user_rooms

  has_many :messages

  scope :to_follow, ->(current_user) { where.not(id: current_user).where.not(id: current_user.followeds) }

  validate :photo_validation

  def photo_validation
    return unless photo.attached?

    return if photo.blob.content_type.starts_with?('image/')

    photo.purge
    errors[:base] << 'Wrong format for photo, only PNG and JPG are accepted'
  end

  validate :cover_image_validation

  def cover_image_validation
    return unless cover_image.attached?

    return if cover_image.blob.content_type.starts_with?('image/')

    cover_image.purge
    errors[:base] << 'Wrong format for cover_image, only PNG and JPG are accepted'
  end
end
