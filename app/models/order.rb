class Order < ActiveRecord::Base
  attr_accessible :orderdate, :status

  belongs_to :user
  has_many :items, dependent: :destroy
end
