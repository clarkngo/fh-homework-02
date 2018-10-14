class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, :through => :authorships
 
  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true, length: { minimum: 4 }

  def self.search(keyword)
    if keyword
      Book.where(
        query_string, 
        "%#{keyword}", "%#{keyword}",
        "%#{keyword}", "%#{keyword}",
        "%#{keyword}", "%#{keyword}", 
        "%#{keyword}", "%#{keyword}"
        )
    else 
      Book.all
    end
  end

  def self.query_string
    fields = ''
    fields += 'title ILIKE ?'
    fields += ' OR '
    fields += 'sub_title ILIKE ?',
    fields += 'classification ILIKE ?'
    fields += ' OR '
    fields += 'genre ILIKE ?',
    fields += 'book_type ILIKE ?'
    fields += ' OR '
    fields += 'year ILIKE ?',
    fields += 'first_name ILIKE ?'
    fields += ' OR '
    fields += 'last_name ILIKE ?'
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
