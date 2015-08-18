class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :menus

  def json_attributes
    {name: self.name, price: self.price}
  end
end
