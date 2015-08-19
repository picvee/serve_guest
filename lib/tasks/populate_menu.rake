require 'yaml'

namespace :load do
	task :populate_menu => :environment do
		menu_items = YAML.load_file("config/menu.yml")
		menus_hash = Account.first.menus.inject({}){|menus, m| menus[m.name] = m and menus }
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

namespace :load_account do
	task :populate_account => :environment do
		account_details = YAML.load_file("config/hotel.yml")
		account_names = Account.all.pluck(:name)
		account_details.each do |account, menu_details|
			menus = Menu.joins(:account).where('accounts.name' => account).pluck(:name)
			account = unless account_names.include?(account)
									Account.create(name: account)
								else
									Account.find_by(name: account)
								end
			menu_details.each do |menu|
				unless menus.include?(menu)							
					Menu.create(name: menu, account_id: account.id).errors
				end
			end
		end
	end
end