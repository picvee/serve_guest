class AddTagAssociation < ActiveRecord::Migration
  def change
    add_column :orders, :tag_id, :integer
  end
end
