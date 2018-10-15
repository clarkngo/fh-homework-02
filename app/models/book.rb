class Book < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true

  def self.query(keyword)
    Book.where(query_string, 
      "#{keyword}", "#{keyword}",
      "#{keyword}", "#{keyword}",
      "#{keyword}", "#{keyword}",
      "#{keyword}", "#{keyword}"
      )
  end

  def query_string
    fields += 'title ILIKE ?'
    fields += ' OR '
    fields += 'genre ILIKE ?'
    fields += ' OR '
    fields += 'classfication ILIKE ?'
    fields += ' OR '
    fields += 'book_type ILIKE ?'
    fields += ' OR '
    fields += 'year ILIKE ?'
    fields += ' OR '
    fields += 'first_name ILIKE ?'
    fields += ' OR '
    fields += 'last_name ILIKE ?'
    fields += ' OR '
    fields += 'age ILIKE ?'
    fields
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
