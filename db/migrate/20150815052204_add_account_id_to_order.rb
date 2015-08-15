class AddAccountIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :account_id, :string
  end
end
