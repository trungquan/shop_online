class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id

  belongs_to :category
  has_many :items


  validates :name, presence: true
  validates :price, presence: true #, numericality: { greater_than_or_equal: 1000}
end
