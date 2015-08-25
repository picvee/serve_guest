class AddWelcomeMsgToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :welcome_msg, :string
  end
end
