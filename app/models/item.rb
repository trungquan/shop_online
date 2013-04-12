class Item < ActiveRecord::Base
  attr_accessible :product_id, :quantity

  belongs_to :order
  belongs_to :product
end
