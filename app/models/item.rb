# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  product_id :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :product_id, :quantity

  belongs_to :order
  belongs_to :product
end
