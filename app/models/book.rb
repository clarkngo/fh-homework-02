class Book < ApplicationRecord
 
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :type_book, presence: true
  validates :year, presence: true, length: { minimum: 4 }

  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term", 
    search_term: "%#{search_term.downcase}%")
  end
end
