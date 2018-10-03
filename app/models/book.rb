class Book < ApplicationRecord
  
  book_classification = [
   'General Works - encyclopedias',
   'Philosophy, Psychology, Religion',
   'History - Auxiliary Sciences',
   'History (except American)',
   'General U.S. History',
   'Local U.S. History',
   'Geography, Anthropology, Recreation',
   'Social Sciences U',
   'Political Science V',
   'Law Z - Bibliography and Library Science',
   'Education',
   'Music',
   'Fine Arts',
   'Language and Literature',
   'Science',
   'Medicine',
   'Agriculture',
   'Technology',
   'Military',
   'Naval Science',
   'Bibliography and Library Science'
  ]

  book_type = [
   'Fiction',
   'Nonfiction'
  ]

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :classification, presence: true, inclusion: { in: book_classification }
  validates :type, presence: true, inclusion: { in: book_type }
  validates :year, presence: true, length: { minimum: 4 }
end
