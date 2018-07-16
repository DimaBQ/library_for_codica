class Book < ApplicationRecord

  validates :name, :body, :all_categories, :all_authors, presence: true

  mount_uploader :image, ImageUploader
  has_many :categorizings, dependent: :destroy
  has_many :authorings, dependent: :destroy
  has_many :authors, through: :authorings
  has_many :categories, through: :categorizings


  def all_categories
    self.categories.map(&:name).join(', ')
  end

  def all_categories=(names)

    self.categories = names.split(',').map do |name|
      Category.where(name: name.strip).first_or_create!
    end

  end


  def all_authors
    self.authors.map(&:name).join(', ')
  end

  def all_authors=(names)
    self.authors = names.split(',').map do |name|
      Author.where(name: name.strip).first_or_create!
    end
  end

end
