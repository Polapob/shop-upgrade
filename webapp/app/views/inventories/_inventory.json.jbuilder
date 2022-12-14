json.extract! inventory, :id, :price, :qty, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
