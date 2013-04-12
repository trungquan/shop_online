# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :string(255)      default("New")
#  orderdate  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :orderdate, :status

  belongs_to :user
  has_many :items, dependent: :destroy
end
