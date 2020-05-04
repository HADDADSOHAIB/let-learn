class Thought < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :text, :author_id, presence: true
  validates :text, length: { maximum: 150 }
end
