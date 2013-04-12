class AddDefaultValueToStatus < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string, default: "New"
  end
end
