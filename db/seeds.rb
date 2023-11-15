# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
restaurants_data = [
  { name: "Chez Jimmy", address: "17 rue des marchands", phone_number: "0682319475", category: "french" },
  { name: "Sushi Express", address: "3 rue de la Paix", phone_number: "0682319476", category: "japanese" },
  { name: "Pasta Paradise", address: "25 rue Edgar", phone_number: "0682319477", category: "italian" },
  { name: "Spicy Bites", address: "17 rue Jean-Paul", phone_number: "0682319478", category: "indian" },
  { name: "Burger Joint", address: "32 rue du Dôme", phone_number: "0682319479", category: "american" }
]

restaurants_data.each do |restaurant_data|
  Restaurant.create(restaurant_data)
end
