class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, :through => :authorships
 
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :book_type, presence: true
  validates :year, presence: true, length: { minimum: 4 }

  def self.search(search_by, search_term)
    where("LOWER(#{search_by}) LIKE :search_term", 
    search_term: "%#{search_term.downcase}%")
  end

end
