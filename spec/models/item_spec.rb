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

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
