class Category < ApplicationRecord
  has_many :category_products
  has_many :products, thorugh: :category_products
end
