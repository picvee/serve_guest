json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :description, :active
  json.url menu_url(menu, format: :json)
end
