class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 1, maximum: 500 }
  VALID_IMAGE_REGEX = /\.(gif|jpg|jpeg|png)\z/i
  validates :image_url, format: { with: VALID_IMAGE_REGEX, message: "must be a URL for GIF, JPG, JPEG, or PNG image." }
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
