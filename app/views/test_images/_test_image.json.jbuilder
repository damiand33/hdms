json.extract! test_image, :id, :name, :description, :image, :created_at, :updated_at
json.url test_image_url(test_image, format: :json)