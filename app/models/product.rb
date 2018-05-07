class Product < ApplicationRecord
    belongs_to :user
    mount_uploader :product_image, ImageUploader
end
