class Menu < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :items
  belongs_to :account

  def json_attributes
    {name: self.name, items: self.items.collect{|item| item.json_attributes}}
  end
end