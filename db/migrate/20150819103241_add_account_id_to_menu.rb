class AddAccountIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :account_id, :integer
  end
end
