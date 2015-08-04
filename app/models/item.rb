class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :menus
end
