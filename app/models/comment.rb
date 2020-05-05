class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :thought

  validates :text, :user_id, :thought_id, presence: true
  validates :text, length: { maximum: 50 }
end
