class Book < ApplicationRecord
 
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :type_book, presence: true
  validates :year, presence: true, length: { minimum: 4 }
end
