class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category
    mount_uploader :product_image, ImageUploader
end
