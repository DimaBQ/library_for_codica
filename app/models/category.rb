class Category < ApplicationRecord
  has_many :categorizings
  has_many :books, through: :categorizings
end
