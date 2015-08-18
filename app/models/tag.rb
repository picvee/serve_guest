class Tag < ActiveRecord::Base
  has_many :orders
end
