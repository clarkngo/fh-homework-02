class Author < ApplicationRecord
  has_many :authorships
  has_many :books, :through => :authorships
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
