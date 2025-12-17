class JournalEntry < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :content, presence: true

  # Image uploads
  has_many_attached :images

  # Search functionality
  scope :search, ->(query) {
    where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%")
  }
end
