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

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
