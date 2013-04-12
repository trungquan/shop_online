# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  price       :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id

  belongs_to :category
  has_many :items


  validates :name, presence: true
  validates :price, presence: true #, numericality: { greater_than_or_equal: 1000}
end
