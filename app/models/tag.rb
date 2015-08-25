class Tag < ActiveRecord::Base
  has_many :orders
  belongs_to :account
end
