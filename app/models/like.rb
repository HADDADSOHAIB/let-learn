class Like < ApplicationRecord
  belongs_to :thought
  belongs_to :user

  validates :thought_id, uniqueness: { scope: :user_id }
end
