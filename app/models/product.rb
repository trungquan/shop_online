class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price

  belongs_to :categories

  NUMBERS = /\A+\d+\z/
  validates :name, presence: true
  validates :price, presence: true, format: { with: NUMBERS }
end
