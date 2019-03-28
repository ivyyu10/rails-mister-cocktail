# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

ingredient_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(ingredient_url).read)

Ingredient.destroy_all if Rails.env.development?

ingredients['drinks'].each do |i|
  Ingredient.create!(name: i["strIngredient1"])
end
puts "We have created #{Ingredient.count} ingredients!"



cocktail_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
cocktails = JSON.parse(open(cocktail_url).read)

Cocktail.destroy_all if Rails.env.development?

cocktails["drinks"].each do |c|
  Cocktail.create!(name: c["strDrink"], image: c["strDrinkThumb"])
end
puts "We have created #{Cocktail.count} cocktails!"
