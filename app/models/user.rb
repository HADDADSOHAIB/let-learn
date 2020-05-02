class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :photo
  has_one_attached :cover_image

  has_many :thoughts, foreign_key: :author_id, dependent: :destroy

  has_many :relation_followers, foreign_key: :follower_id, class_name: 'Following'
  has_many :followers, through: :relation_followers

  has_many :relation_followeds, foreign_key: :followed_id, class_name: 'Following'
  has_many :followeds, through: :relation_followeds
end
