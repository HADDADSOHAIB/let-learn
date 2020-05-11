class Following < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  validates :followed_id, uniqueness: { scope: :follower_id }
end
