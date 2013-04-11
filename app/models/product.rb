class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id

  belongs_to :category
  has_many :items

  # NUMBERS = /\A+[0-9]+\z/
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal: 0}
end
