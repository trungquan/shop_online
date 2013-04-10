class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :products, dependent: :destroy
  
  validate :name, presence: true
end
