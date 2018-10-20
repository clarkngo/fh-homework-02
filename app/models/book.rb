class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, :through => :authorships

  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true

  def self.search(term)
    year_term = nil

    if term
      if term.length == 4 && term.to_i != 0
        year_term = term.to_i
      end
      
      q = "%#{term}%"
      
      includes(:authors).where(query_string, 
            q, q, q, q, q, q, 
            year_term).references(:authors)
    else
      all
    end
  end

  def self.query_string
    fields = ""
    fields += 'authors.first_name ILIKE ?'
    fields += ' OR '
    fields += 'authors.last_name ILIKE ?'
    fields += ' OR '
    fields += 'title ILIKE ?'
    fields += ' OR '
    fields += 'genre ILIKE ?'
    fields += ' OR '
    fields += 'classification ILIKE ?'
    fields += ' OR '
    fields += 'book_type ILIKE ?'
    fields += ' OR '
    fields += 'year = ?'
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
