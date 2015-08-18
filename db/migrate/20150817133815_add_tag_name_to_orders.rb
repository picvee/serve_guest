class AddTagNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tag_name, :string
  end
end
