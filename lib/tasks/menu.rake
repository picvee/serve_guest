require 'yaml'

namespace :db do
task :populate_menu => :environment do
	puts "hello world"
	menu_items = YAML.load_file("config/menu.yml")
	menu_items.each do |menu, items|
		if Menu.where(:name => menu).blank?
			Menu.create(name: menu)
		end	
		items.each do |name, price|
			if Item.where(:name => name).blank?
				Item.create(name: name, price: price)
			end
		end
	end
end
end