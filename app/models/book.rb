class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, :through => :authorships

  validates :title, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true

=begin
  def self.search(search_by, search_term)
    where("LOWER(#{search_by}) LIKE :search_term",
    search_term: "%#{search_term.downcase}%")
  end
=end

  def self.search(term)
    if term
      where("title LIKE ?", "%#{term}%")
    else
      all
    end
  end


=begin
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
=end
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
