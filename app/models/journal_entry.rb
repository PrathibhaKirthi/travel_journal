class JournalEntry < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true

  
  has_many_attached :images

 
  scope :search, ->(query) {
    where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%")
  }
end
