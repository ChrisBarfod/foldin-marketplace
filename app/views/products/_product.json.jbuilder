json.extract! product, :id, :name, :description, :price, :postage, :catagories, :created_at, :updated_at
json.url product_url(product, format: :json)
