class Account < ActiveRecord::Base
	has_many :menus
	has_many :tags
end
