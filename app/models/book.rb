class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, :through => :authorships

  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true

  def self.search(term)
    q = "%#{term}%"

    if term
      .joins(:books, :authorships).where(
        query_string,
       q, q, q, q)
    else
      all
    end
  end

  def self.query_string
    fields = ""
    fields += 'title ILIKE ?'
    fields += ' OR '
    fields += 'genre ILIKE ?'
    fields += ' OR '
    fields += 'classification ILIKE ?'
    fields += ' OR '
    fields += 'book_type ILIKE ?'
=begin
    fields += ' OR '
    fields += 'year = ?'

    fields += ' OR '
    fields += 'first_name ILIKE ?'
    fields += ' OR '
    fields += 'last_name ILIKE ?'
    fields += ' OR '
    fields += 'age ILIKE ?'
=end
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
