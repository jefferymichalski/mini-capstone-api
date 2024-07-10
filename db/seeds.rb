# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.create!(name: "Coffee", price: 5, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfNxK8WhZA3mqZZ7dN_Hq1idc-UqA8dpmcew&s", description: "a smooth Puerto Rican roast")
Product.create!(name: "Signature Mug", price: 15, image_url: "https://example.com/mug.jpg", description: "A beautiful mug for your morning coffee")
