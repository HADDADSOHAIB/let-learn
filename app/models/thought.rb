class Thought < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  validates :text, :author_id, presence: true
  validates :text, length: { maximum: 150 }

  scope :time_line, ->current_user { where(author: current_user.followeds).or(where(author: current_user)).includes(author: [:photo_attachment, :cover_image_attachment]).order(updated_at: :desc) }
end
