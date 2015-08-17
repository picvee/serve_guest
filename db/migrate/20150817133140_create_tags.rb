class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      validates_uniqueness_of :name
      t.timestamps null: false
    end
  end
end
