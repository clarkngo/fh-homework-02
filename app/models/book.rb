class Book < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true

  def self.query(keyword)
    
  end

  def keyword

  end

  def self.classifications
    [
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
  end

  def self.book_types
    [
      'Fiction',
      'Nonfiction'
    ]  
  end
end
