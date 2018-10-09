class Authorship < ApplicationRecord
  belongs_to :authors
  belongs_to :books
end
