class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id

  belongs_to :categories

  NUMBERS = /\A+[0-9]+\z/
  validates :name, presence: true
  validates :price, presence: true, format: { with: NUMBERS }
end
