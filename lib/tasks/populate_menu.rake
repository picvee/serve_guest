require 'yaml'

namespace :load do
	task :populate_menu => :environment do
		menu_items = YAML.load_file("config/menu.yml")
		menus_hash = Menu.all.inject({}){|menus, m| menus[m.name] = m and menus }
		items_hash = Item.all.inject({}){|items, i| items[i.name] = i and items }
		menu_items.each do |menu_name, items|
			menus_hash[menu_name] = Menu.create(name: menu_name) if menus_hash[menu_name].blank?
			menu_items = []
			items.each do |item_name, price|
				items_hash[item_name] = Item.create(name: item_name, price: price) if items_hash[item_name].blank?
				menu_items << items_hash[item_name]
			end
			menus_hash[menu_name].items = menu_items
		end
	end
end